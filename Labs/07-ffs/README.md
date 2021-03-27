## 1. Preparation tasks

#### Characteristic equations and completed tables for D, JK, T flip-flops:

![]()

| clk   | d    | Q(n) | Q(n+1) | Comments           |
| ----- | ---- | ---- | ------ | ------------------ |
| ![]() | 0    | 0    | 0      | No change          |
|       | 0    | 1    | 1      | No change          |
|       | 1    | 0    | 0      | Set (stored to FF) |
|       | 1    | 1    | 1      | Set (stored to FF) |

| clk  | j    | k    | Q(n) | Q(n+1) | Comments  |
| ---- | ---- | ---- | ---- | ------ | --------- |
|      | 0    | 0    | 0    | 0      | No change |
|      | 0    | 0    | 1    | 1      | No change |
|      | 0    | 1    | 0    | 0      | Reset     |
|      | 0    | 1    | 1    | 0      | Reset     |
|      | 1    | 0    | 0    | 1      | Set       |
|      | 1    | 0    | 1    | 1      | Set       |
|      | 1    | 1    | 0    | 1      | Toggle    |
|      | 1    | 1    | 1    | 0      | Toggle    |

| clk  | t    | Q(n) | Q(n+1) | Comments        |
| ---- | ---- | ---- | ------ | --------------- |
|      | 0    | 0    | 0      | No change       |
|      | 0    | 1    | 1      | No change       |
|      | 1    | 0    | 1      | Invert (Toggle) |
|      | 1    | 1    | 0      | Invert (Toggle) |

