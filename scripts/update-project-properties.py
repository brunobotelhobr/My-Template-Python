import toml

with open('pyproject.toml', 'r') as file:
    data = toml.load(file)

print("Current project properties:")

print(f"   name: {data['tool']['poetry']['name']}")
print(f"   version: {data['tool']['poetry']['version']}")
print(f"   license: {data['tool']['poetry']['license']}")
print(f"   description: {data['tool']['poetry']['description']}")
print(f"   authors: {data['tool']['poetry']['authors']}")
print(f"   readme: {data['tool']['poetry']['readme']}")
print(f"   packages: {data['tool']['poetry']['packages']}")
print(f"   repository: {data['tool']['poetry']['repository']}")
print(f"   homepage: {data['tool']['poetry']['homepage']}")
print(f"   keywords: {data['tool']['poetry']['keywords']}")
print(f"   dependencies: {data['tool']['poetry']['dependencies']}")
print("")
print("Type new values for the project properties or press enter to keet the actual value:")


new_values = []
for key in data['tool']['poetry']:
    if key != "group":
        value = input(f"   {key} :")
        if value != "":
            new_values.append(f"{key} = \"{value}\"")

if len(new_values) > 0:
    with open('pyproject.toml', 'r+') as file:
        data_str = file.read()
        for new_value in new_values:
            data_str = data_str.replace(f"{new_value.split('=')[0].strip()} = \"{data['tool']['poetry'][new_value.split('=')[0].strip()]}\"", new_value)
        file.seek(0)
        file.write(data_str)
        file.truncate()
