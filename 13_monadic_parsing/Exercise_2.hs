module Exercise_2 where

{-
2+3+4
Left associative tree:
/
└── expr
    ├── expr
    │   └── term
    │       └── nat
    │           └── 4
    ├── +
    └── expr
        ├── expr
        │   ├── term
        │   └── nat
        │       └── 3
        ├── +
        └── expr
            └── term
                └── nat
                    └── 2

Right associative tree:
/
└── expr
    ├── expr
    │   ├── expr
    │   │   └── term
    │   │       └── factor
    │   │           └── nat
    │   │               └── 4
    │   ├── +
    │   └── expr
    │       └── term
    │           └── factor
    │               └── nat
    │                   └── 3
    ├── +
    └── expr
        └── term
            └── factor
                └── nat
                    └── 2

-}
