//
//  myClassInfo.h
//  objc
//


#ifndef myClassInfo_h
#define myClassInfo_h


//isa.h LINE-57
# if __arm64__
#   define ISA_MASK        0x0000000ffffffff8ULL
# elif __x86_64__
#   define ISA_MASK        0x00007ffffffffff8ULL
# endif


//objc-runtime-new.h  LINE-27
#if __LP64__
typedef uint32_t mask_t;  // x86_64 & arm64 asm are less efficient with 16-bits
#else
typedef uint16_t mask_t;
#endif
typedef uintptr_t cache_key_t;


//objc-runtime-new.h  LINE-505
#define FAST_DATA_MASK          0x00007ffffffffff8UL


//objc-runtime-new.h  LINE-37
struct bucket_t {
public:
    // IMP-first is better for arm64e ptrauth and no worse for arm64.
    // SEL-first is better for armv7* and i386 and x86_64.
#if __arm64__
    MethodCacheIMP _imp;
    cache_key_t _key;
#else
    cache_key_t _key;
    IMP _imp;
#endif
};


//objc-cache.mm LINE-155
#if __arm__  ||  __x86_64__  ||  __i386__
// objc_msgSend has few registers available.
// Cache scan increments and wraps at special end-marking bucket.
#define CACHE_END_MARKER 1
static inline mask_t cache_next(mask_t i, mask_t mask) {
    return (i+1) & mask;
}

#elif __arm64__
// objc_msgSend has lots of registers available.
// Cache scan decrements. No end marker needed.
#define CACHE_END_MARKER 0
static inline mask_t cache_next(mask_t i, mask_t mask) {
    return i ? i-1 : mask;
}

#else
#error unknown architecture
#endif



/*   objc-runtime-new.h  LINE-524
 bucket_t * cache_t::find(cache_key_t k, id receiver)
 {
 assert(k != 0);
 
 bucket_t *b = buckets();
 mask_t m = mask();
 mask_t begin = cache_hash(k, m);
 mask_t i = begin;
 do {
 if (b[i].key() == 0  ||  b[i].key() == k) {
 return &b[i];
 }
 } while ((i = cache_next(i, m)) != begin);
 
 // hack
 Class cls = (Class)((uintptr_t)this - offsetof(objc_class, cache));
 cache_t::bad_cache(receiver, (SEL)k, cls);
 }
 */

//objc-runtime-new.h  LINE-59
struct cache_t {
    struct bucket_t *_buckets;
    mask_t _mask;
    mask_t _occupied;
    
    IMP imp(SEL selector)
    {
        mask_t begin = _mask & (long long)selector;
        mask_t i = begin;
        do {
            if (_buckets[i]._key == 0  ||  _buckets[i]._key == (long long)selector) {
                return _buckets[i]._imp;
            }
        } while ((i = cache_next(i, _mask)) != begin);
        return NULL;
    }
};

/* OC对象 */
struct my_objc_object {
    void *isa;
};

//objc-runtime-new.h  LINE-222
struct method_t {
    SEL name;
    const char *types;
    IMP imp;
};

//objc-runtime-new.h  LINE-100
struct entsize_list_tt {
    uint32_t entsizeAndFlags;
    uint32_t count;
};

//objc-runtime-new.h  LINE-265
struct method_list_t : entsize_list_tt{
    bool isFixedUp() const;
    void setFixedUp();
};


//objc-runtime-new.h  LINE-287
typedef uintptr_t protocol_ref_t;  // protocol_t *, but unremapped


//objc-runtime-new.h  LINE-343
struct protocol_list_t {
    // count is 64-bit by accident.
    uintptr_t count;
    protocol_ref_t list[0]; // variable-size
};


struct property_list_t : entsize_list_tt{
};


//objc-runtime-new.h  LINE-277
struct ivar_list_t : entsize_list_tt {
   
};


//objc-runtime-new.h  LINE-553
struct class_ro_t {
    uint32_t flags;
    uint32_t instanceStart;
    uint32_t instanceSize;
#ifdef __LP64__
    uint32_t reserved;
#endif

    const uint8_t * ivarLayout;

    const char * name;
    method_list_t * baseMethodList;
    protocol_list_t * baseProtocols;
    const ivar_list_t * ivars;

    const uint8_t * weakIvarLayout;
    property_list_t *baseProperties;

    method_list_t *baseMethods() const {
        return baseMethodList;
    }
};

//objc-runtime-new.h  LINE-802
class property_array_t{
};


//objc-runtime-new.h  LINE-826
struct class_rw_t {
    // Be warned that Symbolication knows the layout of this structure.
    uint32_t flags;
    uint32_t version;
    
    const class_ro_t *ro;
    
    method_list_t *methods;
    property_array_t properties;
    protocol_list_t *protocols;
    
    Class firstSubclass;
    Class nextSiblingClass;
    
    char *demangledName;
};

//objc-runtime-new.h  LINE-870
struct class_data_bits_t {
    uintptr_t bits;
public:
    class_rw_t* data() {
        return (class_rw_t *)(bits & FAST_DATA_MASK);
    }
};


struct my_objc_class : my_objc_object {
    // Class ISA;
    Class superclass;
    cache_t cache;             // formerly cache pointer and vtable
    class_data_bits_t bits;    // class_rw_t * plus custom rr/alloc flags
    class_rw_t *data() {
        return bits.data();
    }
    my_objc_class* metaClass() {
        return (my_objc_class *)((long long)isa & ISA_MASK);
    }
};
#endif /* myClassInfo_h */

