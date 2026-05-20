# visualCountDown API Reference
Generated: 2026-05-20

a node that will display a countdown on screen

## Class: CountDown2D
**Inherits:** [NumbersUI2D](git@github.com:ChillCube/NumberDisplay/blob/main/DOCUMENTATION.md)


### ⚙️ Inspector Variables (Exported)
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **count** | `int` | `10` | Starting value of the countdown; resets the displayed number when changed |
| **count_length** | `float` | `1.0` | Duration in seconds between each decrement |
| **autostart** | `bool` | `false` | If true, the countdown starts automatically when the node enters the scene |
| **one_shot** | `bool` | `false` | If true, the countdown stops (and optionally destroys itself) when it reaches zero instead of looping |
| **destroy_on_finish** | `bool` | `false` | If true and one_shot is enabled, queue_frees the node when the countdown finishes |

### 🔔 Signals
| Signal | Arguments | Description |
| :--- | :--- | :--- |
| **countdown_finished** | - |  Emitted when the countdown reaches zero |
| **countdown_started** | `starting_count: int` |  Emitted when the countdown begins running |
| **tick** | `remaining: int` |  Emitted on each decrement with the new remaining value |

### 🛠️ Methods
| Method | Arguments | Returns | Description |
| :--- | :--- | :--- | :--- |
| **start()** | - | `void` |  Resets and starts the countdown from the initial count value |
| **stop()** | - | `void` |  Pauses the countdown without resetting the current number |
| **count_down()** | - | `void` |  Decrements the displayed number by 1; emits countdown_finished and handles one_shot/destroy logic at zero |

---

