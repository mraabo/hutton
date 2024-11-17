module Exercise_3 where

{-
2+3
Only one tree possible:
/
└── expr
    ├── expr
    │   └── term
    │       └── factor
    │           └── nat
    │               └── 3
    ├── +
    └── term
        └── factor
            └── nat
                └── 2
-}

{-
2*3*4
Only one tree is possible:
/
└── expr
    └── term
        ├── term
        │   ├── term
        │   │   └── factor
        │   │       └── nat
        │   │           └── 4
        │   ├── *
        │   └── factor
        │       └── nat
        │           └── 3
        ├── *
        └── factor
            └── nat
                └── 2
-}

{-
(2+3)+4
Only one tree is possible:
/
└── expr
    ├── expr
    │   └── term
    │       └── factor
    │           └── nat
    │               └── 4
    ├── +
    └── term
        └── factor
            ├── )
            ├── expr
            │   ├── expr
            │   │   └── term
            │   │       └── factor
            │   │           └── nat
            │   │               └── 3
            │   ├── +
            │   └── term
            │       └── factor
            │           └── nat
            │               └── 2
            └── (
-}
