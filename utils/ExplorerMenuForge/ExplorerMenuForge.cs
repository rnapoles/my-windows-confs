using System;
using System.IO;
using System.Linq;
using System.Text;

namespace ExplorerMenuForge
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length == 0)
            {
                Console.WriteLine("Usage:");
                Console.WriteLine("  ExplorerMenuForge.exe <executable_path> [<executable_path> ...]");
                Console.WriteLine("  ExplorerMenuForge.exe -f <file_with_paths>");
                return;
            }

            string[] executablePaths;

            // Check if input is from a file
            if (args[0] == "-f" && args.Length > 1)
            {
                string filePath = args[1];
                if (!File.Exists(filePath))
                {
                    Console.WriteLine(string.Format("Error: File '{0}' not found.", filePath));
                    return;
                }

                executablePaths = File.ReadAllLines(filePath)
                    .Where(line => !string.IsNullOrWhiteSpace(line))
                    .ToArray();
            }
            else
            {
                // Input is from command line arguments
                executablePaths = args;
            }

            // Generate the registry file
            string regFileContent = GenerateRegistryFile(executablePaths);

            // Write to file
            string outputPath = "context-menu.reg";
            File.WriteAllText(outputPath, regFileContent);

            Console.WriteLine(string.Format("Registry file generated successfully: {0}", Path.GetFullPath(outputPath)));
        }

        static string GenerateRegistryFile(string[] executablePaths)
        {
            StringBuilder sb = new StringBuilder();
            
            // Add registry file header
            sb.AppendLine("Windows Registry Editor Version 5.00");
            sb.AppendLine();
            
            // Add context menu setup for Directory and Directory Background
            sb.AppendLine(";This displays context menu when you right-click Directory");
            sb.AppendLine("[HKEY_CLASSES_ROOT\\Directory\\shell\\MyMenu1]");
            sb.AppendLine(";Directory Level Menu Title");
            sb.AppendLine("\"MUIVerb\"=\"MyNewMenu\"");
            sb.AppendLine("\"Icon\"=\"cmd.exe\"");
            sb.AppendLine("\"ExtendedSubCommandsKey\"=\"Directory\\\\ContextMenus\\\\MyMenu1\"");
            sb.AppendLine();
            
            sb.AppendLine(";This displays context menu when you right-click Directory Background");
            sb.AppendLine("[HKEY_CLASSES_ROOT\\Directory\\background\\shell\\MyMenu1]");
            sb.AppendLine(";Background Level Menu Title");
            sb.AppendLine("\"MUIVerb\"=\"MyNewMenu\"");
            sb.AppendLine("\"Icon\"=\"cmd.exe\"");
            sb.AppendLine("\"ExtendedSubCommandsKey\"=\"Directory\\\\ContextMenus\\\\MyMenu1\"");
            sb.AppendLine();
            
            // Add separator after header
            sb.AppendLine(";-----------------------------");
            sb.AppendLine();

            bool isFirstEntry = true;
            foreach (string path in executablePaths)
            {
                // Add separator between entries (but not before the first one)
                if (!isFirstEntry)
                {
                    sb.AppendLine(";-----------------------------");
                    sb.AppendLine();
                }
                else
                {
                    isFirstEntry = false;
                }

                if (!File.Exists(path))
                {
                    Console.WriteLine(string.Format("Warning: File '{0}' does not exist, but adding it anyway.", path));
                }

                // Extract application name from path
                string appName = Path.GetFileNameWithoutExtension(path);
                
                // Get Full path
                string fullPath = Path.GetFullPath(path);

                // Escape backslashes for registry format
                string escapedPath = fullPath.Replace("\\", "\\\\");

                // Add registry entries
                sb.AppendLine(string.Format("[HKEY_CLASSES_ROOT\\Directory\\ContextMenus\\MyMenu1\\shell\\{0}]", appName));
                sb.AppendLine(string.Format("\"MUIVerb\"=\"Open with {0}\"", appName));
                sb.AppendLine("\"Position\"=\"top\"");
                sb.AppendLine(string.Format("\"Icon\"=\"{0}\"", escapedPath));
                sb.AppendLine();
                
                sb.AppendLine(string.Format("[HKEY_CLASSES_ROOT\\Directory\\ContextMenus\\MyMenu1\\shell\\{0}\\command]", appName));
                sb.AppendLine(string.Format("@=\"{0} \\\"%1\\\"\"", escapedPath));
                sb.AppendLine();
            }

            return sb.ToString();
        }
    }
}