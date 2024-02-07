#ifndef EXTERNAL_VALUE_H
#define EXTERNAL_VALUE_H

#include "ruby/config.h"

#if defined(__DOXYGEN__)

/**
 * Type that represents a Ruby object.  It is an unsigned integer of some kind,
 * depending on platforms.
 *
 * ```CXX
 * VALUE value = rb_eval_string("ARGF.readlines.map.with_index");
 * ```
 *
 * @warning  ::VALUE is not a pointer.
 * @warning  ::VALUE can be wider than `long`.
 */
typedef uintptr_t VALUE;

/**
 * Type that represents a Ruby identifier such as a variable name.
 *
 * ```CXX
 * ID method = rb_intern("method");
 * VALUE result = rb_funcall(obj, method, 0);
 * ```
 *
 * @note  ::rb_cSymbol is a Ruby-level data type for the same thing.
 */
typedef uintptr_t ID;

/**
 * A signed integer type that has the same width with ::VALUE.
 *
 * @internal
 *
 * @shyouhei wonders: is it guaranteed  that `uintptr_t` and `intptr_t` are the
 * same width?  As far as I read ISO/IEC 9899:2018 section 7.20.1.4 paragraph 1
 * no such description is given... or defined elsewhere?
 */
typedef intptr_t SIGNED_VALUE;

/**
 * Identical to  `sizeof(VALUE)`, except it  is a macro  that can also  be used
 * inside of preprocessor directives such as `#if`.  Handy on occasions.
 */
#define SIZEOF_VALUE SIZEOF_UINTPTR_T

/**
 * @private
 *
 * A compile-time constant of type ::VALUE whose value is 0.
 */
#define RBIMPL_VALUE_NULL UINTPTR_C(0)

/**
 * @private
 *
 * A compile-time constant of type ::VALUE whose value is 1.
 */
#define RBIMPL_VALUE_ONE  UINTPTR_C(1)

/**
 * @private
 *
 * Maximum possible value that a ::VALUE can take.
 */
#define RBIMPL_VALUE_FULL UINTPTR_MAX

#elif defined HAVE_UINTPTR_T && 0
typedef uintptr_t VALUE;
typedef uintptr_t ID;
# define SIGNED_VALUE intptr_t
# define SIZEOF_VALUE SIZEOF_UINTPTR_T
# undef PRI_VALUE_PREFIX
# define RBIMPL_VALUE_NULL UINTPTR_C(0)
# define RBIMPL_VALUE_ONE  UINTPTR_C(1)
# define RBIMPL_VALUE_FULL UINTPTR_MAX

#elif SIZEOF_LONG == SIZEOF_VOIDP
typedef unsigned long VALUE;
typedef unsigned long ID;
# define SIGNED_VALUE long
# define SIZEOF_VALUE SIZEOF_LONG
# define PRI_VALUE_PREFIX "l"
# define RBIMPL_VALUE_NULL 0UL
# define RBIMPL_VALUE_ONE  1UL
# define RBIMPL_VALUE_FULL ULONG_MAX

#elif SIZEOF_LONG_LONG == SIZEOF_VOIDP
typedef unsigned LONG_LONG VALUE;
typedef unsigned LONG_LONG ID;
# define SIGNED_VALUE LONG_LONG
# define LONG_LONG_VALUE 1
# define SIZEOF_VALUE SIZEOF_LONG_LONG
# define PRI_VALUE_PREFIX PRI_LL_PREFIX
# define RBIMPL_VALUE_NULL 0ULL
# define RBIMPL_VALUE_ONE  1ULL
# define RBIMPL_VALUE_FULL ULLONG_MAX

#else
# error ---->> ruby requires sizeof(void*) == sizeof(long) or sizeof(LONG_LONG) to be compiled. <<----
#endif

#if defined(USE_FLONUM)
# /* Take that. */
#elif SIZEOF_VALUE >= SIZEOF_DOUBLE
# define USE_FLONUM 1
#else
# define USE_FLONUM 0
#endif

#undef Qfalse
#define Qfalse          RUBY_PARSER_Qfalse            /**< @old{RUBY_Qfalse} */
#undef Qnil
#define Qnil            RUBY_PARSER_Qnil              /**< @old{RUBY_Qnil} */
#undef Qtrue
#define Qtrue           RUBY_PARSER_Qtrue             /**< @old{RUBY_Qtrue} */
#undef Qundef
#define Qundef          RUBY_PARSER_Qundef            /**< @old{RUBY_Qundef} */

enum
ruby_parser_special_consts {
#if defined(__DOXYGEN__)
    RUBY_PARSER_Qfalse,                /**< @see ::rb_cFalseClass */
    RUBY_PARSER_Qtrue,                 /**< @see ::rb_cTrueClass */
    RUBY_PARSER_Qnil,                  /**< @see ::rb_cNilClass */
    RUBY_PARSER_Qundef,                /**< Represents so-called undef. */
#elif USE_FLONUM
    RUBY_PARSER_Qfalse         = 0x00, /* ...0000 0000 */
    RUBY_PARSER_Qnil           = 0x04, /* ...0000 0100 */
    RUBY_PARSER_Qtrue          = 0x14, /* ...0001 0100 */
    RUBY_PARSER_Qundef         = 0x24, /* ...0010 0100 */
#else
    RUBY_PARSER_Qfalse         = 0x00, /* ...0000 0000 */
    RUBY_PARSER_Qnil           = 0x02, /* ...0000 0010 */
    RUBY_PARSER_Qtrue          = 0x06, /* ...0000 0110 */
    RUBY_PARSER_Qundef         = 0x0a, /* ...0000 1010 */
#endif
};

#undef RUBY_Qfalse
#define RUBY_Qfalse RBIMPL_CAST((VALUE)RUBY_PARSER_Qfalse)
#undef RUBY_Qtrue
#define RUBY_Qtrue  RBIMPL_CAST((VALUE)RUBY_PARSER_Qtrue)
#undef RUBY_Qnil
#define RUBY_Qnil   RBIMPL_CAST((VALUE)RUBY_PARSER_Qnil)
#undef RUBY_Qundef
#define RUBY_Qundef RBIMPL_CAST((VALUE)RUBY_PARSER_Qundef)

#endif /* EXTERNAL_VALUE_H */
