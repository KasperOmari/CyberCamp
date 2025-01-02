import random
import os
import sys
import time
from colorama import init, Fore, Back

# Initialize colorama
init(autoreset=True)

# Game settings
WIDTH = 20
HEIGHT = 10
SNAKE_CHAR = "O"
FOOD_CHAR = "X"
EMPTY_CHAR = "."

# Initialize game state
snake = [(5, 5)]  # Snake starts in the middle
food = (random.randint(0, HEIGHT - 1), random.randint(0, WIDTH - 1))
direction = (0, 1)  # Moving right by default


def draw_board():
    """Draws the game board."""
    os.system("cls" if os.name == "nt" else "clear")
    for y in range(HEIGHT):
        for x in range(WIDTH):
            if (y, x) in snake:
                print(Fore.GREEN + SNAKE_CHAR, end="")
            elif (y, x) == food:
                print(Fore.RED + FOOD_CHAR, end="")
            else:
                print(EMPTY_CHAR, end="")
        print()
    print("\nUse W (up), A (left), S (down), D (right) to move. Press Q to quit.")


def move_snake():
    """Moves the snake in the current direction."""
    global food
    head_y, head_x = snake[0]
    new_head = (head_y + direction[0], head_x + direction[1])

    # Check for collision with walls or self
    if (
        new_head[0] < 0
        or new_head[0] >= HEIGHT
        or new_head[1] < 0
        or new_head[1] >= WIDTH
        or new_head in snake
    ):
        print(Fore.RED + "Game Over! Your score: " + str(len(snake) - 1))
        sys.exit()

    snake.insert(0, new_head)

    # Check for food collision
    if new_head == food:
        food = (random.randint(0, HEIGHT - 1), random.randint(0, WIDTH - 1))
    else:
        snake.pop()  # Remove tail if no food eaten


def change_direction(new_dir):
    """Changes the snake's direction if valid."""
    global direction
    if new_dir == "w" and direction != (1, 0):  # Up
        direction = (-1, 0)
    elif new_dir == "s" and direction != (-1, 0):  # Down
        direction = (1, 0)
    elif new_dir == "a" and direction != (0, 1):  # Left
        direction = (0, -1)
    elif new_dir == "d" and direction != (0, -1):  # Right
        direction = (0, 1)


def main():
    """Main game loop."""
    global direction
    try:
        while True:
            draw_board()
            move_snake()
            time.sleep(0.2)

            if os.name == "nt":  # Windows
                if msvcrt.kbhit():
                    key = msvcrt.getch().decode("utf-8").lower()
                    if key == "q":
                        break
                    change_direction(key)
            else:  # Non-Windows (Linux/Mac)
                import termios, tty

                fd = sys.stdin.fileno()
                old_settings = termios.tcgetattr(fd)
                try:
                    tty.setraw(fd)
                    key = sys.stdin.read(1).lower()
                    if key == "q":
                        break
                    change_direction(key)
                finally:
                    termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
    except KeyboardInterrupt:
        print("\nGame interrupted. Exiting.")


if __name__ == "__main__":
    main()
