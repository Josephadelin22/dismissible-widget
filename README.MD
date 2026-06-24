
```markdown
# Widget Presentation - Dismissible Demo

This is a small Flutter project I made for my Mobile Application Development class to show how the `Dismissible` widget works. It is a simple To-Do list where you can swipe items to archive or delete them, just like in Gmail.

##  How to Run it

1. Make sure Flutter is installed on your laptop.
2. Clone this repo:
   ```bash
   git clone [https://github.com/Josephadelin22/dismissible-widget.git](https://github.com/Josephadelin22/dismissible-widget.git)

```

3. Run `flutter pub get` in the folder to get the packages.
4. Run `flutter run` with your emulator open.

## The 3 Attributes I focused on

During my demo in class, I explained these three main properties:

* **`key`**: This is required. When you swipe a widget, it disappears from the screen. Flutter needs this unique key to know exactly which item was removed. If you don't give it a unique key, the app crashes.
* **`background` and `secondaryBackground**`: These change what you see behind the item while swiping. I set a green background with a check icon when swiping right (Archive), and a red background with a trash icon when swiping left (Delete).
* **`onDismissed`**: This is the function that runs after the swipe is done. You must put your `setState()` here to remove the item from your list variable.

## Problems I faced during this project

I ran into two big issues while working on this:

### 1. The Duplicate Key Crash

At first, I wanted to see what happens if I forgot to update the code inside `onDismissed`. When I swiped the item, it disappeared from the screen but stayed in my local list variable. On the next frame, Flutter got confused and crashed with a big red "Duplicate Key Exception" because the UI and the data were out of sync.

### 2. Git Push Rejected (Large Files)

When I tried to push my code to GitHub, my `git push` was rejected with an error. This happened because the huge `build/` folder (with `libflutter.so` and the APK files, over 400MB total) was accidentally tracked by Git, and GitHub blocks files over 100MB.

* **How I fixed it:** To save time before the deadline, I deleted the broken `.git` history, created a fresh empty repo on GitHub, and recreated the project. This allowed the `.gitignore` file to properly block the `build/` folder so I could push only my clean code files.

## Screenshot of the App

Here is how the app looks when you start swiping an item:

---

*Note: This code was made by me for the ALU Widget Presentation assignment.*

```

