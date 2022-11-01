import pyautogui
import keyboard
import pyperclip
import os
import shutil

while True:
    if keyboard.is_pressed('m'):
        print("Script activated")
        pyautogui.hotkey('ctrl','f1')
        pyautogui.press(['tab', 'tab'])
        pyautogui.press('right')
        pyautogui.press('space')
        pyautogui.press(['tab', 'tab'])
        pyautogui.press(['down', 'down'])
        source = pyautogui.hotkey('ctrl','c')
        pyautogui.press(['tab', 'tab'])
        pyautogui.press('space')
        pyautogui.press(['f6', 'f6'])
        pyautogui.press('delete')
        fileNameRaw = pyperclip.paste().partition(":")
        sourceFileName = fileNameRaw[2]
        print(sourceFileName)
        break