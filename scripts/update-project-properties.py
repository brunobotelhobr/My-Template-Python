import toml, yaml

with open('pyproject.toml', 'r') as file:
    data = toml.load(file)

print("Current project properties:")

print(f"   name: {data['tool']['poetry']['name']}")
print(f"   version: {data['tool']['poetry']['version']}")
print(f"   license: {data['tool']['poetry']['license']}")
print(f"   description: {data['tool']['poetry']['description']}")
print(f"   authors: {data['tool']['poetry']['authors']}")
print(f"   maintainers: {data['tool']['poetry']['maintainers']}")
print(f"   readme: {data['tool']['poetry']['readme']}")
print(f"   packages: {data['tool']['poetry']['packages']}")
print(f"   repository: {data['tool']['poetry']['repository']}")
print(f"   homepage: {data['tool']['poetry']['homepage']}")
print(f"   keywords: {data['tool']['poetry']['keywords']}")
print(f"   dependencies: {data['tool']['poetry']['dependencies']}")
print("")
print("Type new values for the project properties or press enter to keet the actual value:")

# Read new values
new_values = []
for key in data['tool']['poetry']:
    if key != "group":
        value = input(f"   {key} :")
        if value != "":
            new_values.append(f"{key} = \"{value}\"")

# Update pyproject.toml
if len(new_values) > 0:
    with open('pyproject.toml', 'r+') as file:
        data_str = file.read()
        for new_value in new_values:
            data_str = data_str.replace(f"{new_value.split('=')[0].strip()} = \"{data['tool']['poetry'][new_value.split('=')[0].strip()]}\"", new_value)
        file.seek(0)
        file.write(data_str)
        file.truncate()

# Update MKDocs
with open('pyproject.toml', 'r') as toml_file:
    tom_data = toml.load(toml_file)
    with open('mkdocs.yml', 'r+') as mkdoc_file:
        mkdoc_data = yaml.load(mkdoc_file, Loader=yaml.FullLoader)
        mkdoc_data['site_name'] = tom_data['tool']['poetry']['name']
        mkdoc_data['site_description'] = tom_data['tool']['poetry']['description']
        mkdoc_data['site_author'] = tom_data['tool']['poetry']['authors'][0]
        mkdoc_data['site_url'] = tom_data['tool']['poetry']['homepage']
        mkdoc_data['edit_uri'] = tom_data['tool']['poetry']['homepage'] + "/docs"
        mkdoc_data['repo_url'] = tom_data['tool']['poetry']['repository']
        mkdoc_data['repo_name'] = tom_data['tool']['poetry']['repository'].split("/")[-1] 
        #save
        mkdoc_file.seek(0)
        yaml.dump(mkdoc_data, mkdoc_file)
        mkdoc_file.truncate()
        

