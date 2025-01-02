print("Hi! I'm ChatBot. Ask me anything!")

while True:
    question = input("You: ").lower()
    if "your name" in question:
        print("I'm ChatBot!")
    elif "raspberry pi" in question:
        print("Raspberry Pi is a tiny computer!")
    elif "bye" in question:
        print("Goodbye!")
        break
    else:
        print("Hmm... I don't know about that.")
