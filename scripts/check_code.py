import os
import git
import subprocess
from git import Repo

# Ruta al repositorio Git
repo_path = 'C:\\Work\\vixidev\\apivixi'

# Inicializa el repositorio
repo = Repo(repo_path)

# Obtiene la lista de archivos nuevos y modificados
changed_files = [item.a_path for item in repo.index.diff(None)]

# Filtra solo los archivos PHP
php_files = [file for file in changed_files if file.endswith('.php')]

# Verifica la sintaxis de los archivos PHP
for php_file in php_files:
    file_path = os.path.join(repo_path, php_file)
    
    # Utiliza subprocess para ejecutar el verificador de sintaxis (por ejemplo, PHP linter)
    try:
        subprocess.run(['php', '-l', file_path], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        print(f"OK {php_file}")
    except subprocess.CalledProcessError as e:
        print(f"ERR {php_file}:")
        print(e.stderr.decode())

print("Proceso completado.")
