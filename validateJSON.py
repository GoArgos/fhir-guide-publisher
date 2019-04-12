import sys
import json
import jsonschema

def loadJSON(file):

    try:
        return json.loads(open(file).read())
    except IOError:
        print("Could not open file:", file)
    except ValueError as err:
        print("Could not load JSON file:", file, err)
        return None

def validateJSON():
    """
    Main function, first arg is the input file, optional second one is the output
    file. If no output file is specified then the output is written to stdout.
    """
    if len(sys.argv) > 2:
        f = sys.argv[1]
        f2 = sys.argv[2]

        data = loadJSON(f)
        schema = loadJSON(f2)

        if data is None or schema is None:
            print('Validation not performed.')
        else:
            try:
                jsonschema.validate(data, schema)
            except jsonschema.ValidationError as e:
                print('Validation failed:', e.message)
                print('Path:', e.path)
            except jsonschema.SchemaError as e:
                print(e)
                print('Validation failed: Error in schema.')
            else:
                print('Validation completed: no errors found')
    else:
        print("usage: python validateJSON.py dataFile.json schemaFile.json")

if __name__ == '__main__':
    validateJSON()
