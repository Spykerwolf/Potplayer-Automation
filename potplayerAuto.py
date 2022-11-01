import pyautogui
import keyboard
import pyperclip
import os
import shutil

while True:
    if keyboard.is_pressed('F11'):
        pyperclip.copy('')
        pyautogui.hotkey('ctrl','f1')
        pyautogui.press(['tab', 'tab'])
        pyautogui.press('right')
        pyautogui.press('space')
        pyautogui.press(['tab', 'tab'])
        pyautogui.press(['down', 'down'])
        
        #Copies source file name
        pyautogui.hotkey('ctrl','c') 
        pyautogui.press(['tab', 'tab'])
        pyautogui.press('space')
        pyautogui.press(['f6', 'f6'])
        pyautogui.press('delete')
        
        #Trim file name
        fileNameRaw = pyperclip.paste().split(":", 1)
        sourceLong = fileNameRaw[1].strip()
        print(sourceLong)
        
        
        sourceShort = sourceLong.split("\\")
        print(sourceShort)
        source = sourceShort[2]
        print(source)
        
        destination = r"F:\#######" + "\\" + source
        print(destination)
        shutil.move(sourceLong, destination)
        pyautogui.hotkey('enter')