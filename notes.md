### Notes

- This was pretty cool: https://www.dropbox.com/s/vlbwvq9crzscpvv/Screenshot%202015-08-18%2023.23.21.png?dl=0
- I feel that the inner workings of the game loop inside TicTacToe::Game could be abstracted, but I couldn't find a good abstraction. I suspect that it would become clear after implementing the entire game.
- Deciding between double or models wasn't easy for this app. Some models like `TicTacToe::Position` are so simple that I believe that using them makes the specs tell a better story.
- Dealing with repeating interaction at `TicTacToe::ChoosePlayerMark` was tricky. It's never easy to stub multiple calls to the same method.
- A position on the board could be extracted as its own class, so the board would store a plain array of something like `BoardCell` with its position and state. That could potentially simplify some code on Board (and on Move?).
- The Board class is too generic, and so it has the potential of becoming a god class. I intentionally moved some code from it to the Move class because of that. The winning conditions could also be moved, but it isn't a problem yet (it's still small enough).
- The Board class and spec has a lot of coupling, but I don't think it is necessarily a problem in this case. It acts as an integration point between the smaller parts without being too messy (like Game that has to deal with IO).
