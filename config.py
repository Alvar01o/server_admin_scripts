import ConfigParser

config = ConfigParser.RawConfigParser()

config.add_section('ADMINCS')
config.set('ADMINCS', 'TEMP_DIRECTORY', 'tmp/')
config.set('ADMINCS', 'TOOL_DIRECTORY', 'tools/')

# Writing our configuration file to 'example.cfg'
with open('config.cfg', 'wb') as configfile:
    config.write(configfile)