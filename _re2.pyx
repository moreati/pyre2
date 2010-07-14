namespace shapes {
  class Rectangle {
  public:
    int x0, y0, x1, y1;
    Rectangle(int x0, int y0, int x1, int y1);
    ~Rectangle();
    int getLength();
    int getHeight();
    int getArea();
    void move(int dx, int dy);
  };
}

cdef extern from "re2.h" namespace "re2":
    cdef cppclass RE2:
        cppclass Arg
        cppclass Options
        
        enum ErrorCode:
            NoError = 0,

            # Unexpected error
            ErrorInternal,

            # Parse errors
            ErrorBadEscape,          # bad escape sequence
            ErrorBadCharClass,       # bad character class
            ErrorBadCharRange,       # bad character class range
            ErrorMissingBracket,     # missing closing ]
            ErrorMissingParen,       # missing closing )
            ErrorTrailingBackslash,  # trailing \ at end of regexp
            ErrorRepeatArgument,     # repeat argument missing, e.g. "*"
            ErrorRepeatSize,         # bad repetition argument
            ErrorRepeatOp,           # bad repetition operator
            ErrorBadPerlOp,          # bad perl operator
            ErrorBadUTF8,            # invalid UTF-8 in regexp
            ErrorBadNamedCapture,    # bad named capture group
            ErrorPatternTooLarge,    # pattern too large (compile failed)
        
        static const Options DefaultOptions
        static const Options Latin1
        static const Options POSIX
        static const Options Quiet
        
        RE2(const char* pattern)
        RE2(const string& pattern)
        
        RE2(const StringPiece& pattern)
        RE2(const StringPiece& pattern, const Options& option)
        
        bool ok()
        const string& error()
        const string& pattern()
        ErrorCode error_code()
        const string& error_arg()
        int ProgramSize()
        
        static bool FullMatchN(StringPiece&, RE2&, Arg*, int)
        #static const VariadicFunction2<
        #bool, const StringPiece&, const RE2&, Arg, RE2::FullMatchN> FullMatch
        
        static bool PartialMatchN(const StringPiece&, const RE2&, const Arg*,
                                  int);
        #static const VariadicFunction2<
        #       bool, const StringPiece&, const RE2&, Arg, RE2::PartialMatchN> 
        #       PartialMatch;
        
        static bool ConsumeN(StringPiece* input, const RE2& pattern, args
                             const Arg* const args[], int argc)
        #static const VariadicFunction2<
        #       bool, StringPiece*, const RE2&, Arg, RE2::ConsumeN> Consume;
        
        static bool FindAndConsumeN(StringPiece* input, const RE2& pattern,
                                    const Arg* const args[], int argc);
        #static const VariadicFunction2<
        #       bool, StringPiece*, const RE2&, Arg, RE2::FindAndConsumeN>
        #       FindAndConsume;
      
        static bool Replace(string *,
                            const RE2& ,
                            const StringPiece&)
                      
        static int GlobalReplace(string *,
                                 const RE2& ,
                                 const StringPiece& )
      
        static string QuoteMeta(const StringPiece& )
      
        bool PossibleMatchRange(string*, string*, int) const
      
        enum Anchor:
            UNANCHORED,
            ANCHOR_START,
            ANCHOR_BOTH,
            
        int NumberOfCapturingGroups() const
        
        #const map<string, int>& NamedCapturingGroups() const;
        
        bool Match(const StringPiece&,
                  int,
                  Anchor,
                  StringPiece *,
                  int) const;
        
        bool CheckRewriteString(const StringPiece&, string*) const;
        
        cppclass Options:
            static const int kDefaultMaxMem = 8<<20
            
            enum Encoding:
                EncodingUTF8 = 1
                EncodingLatin1
                
            Encoding encoding()
            set_encoding(Encoding)
            
            bool utf8()
            set_utf8(bool)
            
            bool posix_syntax()
            set_posix_syntax(bool)
            
            bool longest_match()
            set_longest_match(bool)
            
            bool log_errors()
            set_log_errors(bool)
            
            bool max_mem()
            set_max_mem(bool)
            
            bool literal()
            set_literal(bool)
            
            bool never_nl()
            set_never_nl(bool)
            
            bool case_sensitive()
            set_case_sensitive(bool)
            
            bool perl_classes()
            set_perl_classes(bool)
            
            bool word_boundary()
            set_word_boundary(bool)
            
            bool one_line()
            set_one_line(bool)
            
            Copy(const Options&)
        
        static inline Arg CRadix(short*)
        static inline Arg CRadix(unsigned short*)
        static inline Arg CRadix(int*)
        static inline Arg CRadix(unsigned int*)
        static inline Arg CRadix(long*)
        static inline Arg CRadix(unsigned long*)
        static inline Arg CRadix(long long*)
        static inline Arg CRadix(unsinged long long*)
            
        static inline Arg Hex(short*)
        static inline Arg Hex(unsigned short*)
        static inline Arg Hex(int*)
        static inline Arg Hex(unsigned int*)
        static inline Arg Hex(long*)
        static inline Arg Hex(unsigned long*)
        static inline Arg Hex(long long*)
        static inline Arg Hex(unsinged long long*)
            
        static inline Arg Octal(short*)
        static inline Arg Octal(unsigned short*)
        static inline Arg Octal(int*)
        static inline Arg Octal(unsigned int*)
        static inline Arg Octal(long*)
        static inline Arg Octal(unsigned long*)
        static inline Arg Octal(long long*)
        static inline Arg Octal(unsinged long long*)

