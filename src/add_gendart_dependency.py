import os

def add_gendart_dependency(package_path):
    
    package_xml_path = os.path.join(package_path, "package.xml")
    if not os.path.exists(package_xml_path):
        print(f"{package_path} directroies package.xml did not package.xml")
        return None
    
    with open(package_xml_path, "r") as file:
        lines = file.readlines()

    target_line = '  <build_depend>gendart</build_depend>\n'

    if target_line in lines:
        print(f"{package_path} inside have a gendart")
        return

    index_of_package_end = lines.index('</package>\n')
    lines.insert(index_of_package_end, target_line)

    with open(package_xml_path, "w") as file:
        file.writelines(lines)

    print(f"{package_path} package add gendart")



def main():
    catkin_ws_src_path = "/catkin_ws/src"
    
    packages = [d for d in os.listdir(catkin_ws_src_path) if os.path.isdir(os.path.join(catkin_ws_src_path, d))]
    for package in packages:
        print(packages)
        if package !='gendart':
            subdir = os.path.join(catkin_ws_src_path, package)
            subdirs = [d for d in os.listdir(subdir) if os.path.isdir(os.path.join(subdir, d))]
            for package_dir in subdirs:
                print(package_dir)
                package_path = os.path.join(subdir, package_dir)
                add_gendart_dependency(package_path)

if __name__ == "__main__":
    main()
