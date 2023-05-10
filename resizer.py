import math
import sys

import xml.etree.ElementTree as ET

def resize(xml_list, xml_var, factor):
    if xml_list.get(xml_var) is not None:
        xml_list.set(xml_var, str(math.floor(int(xml_list.get(xml_var)) * factor)))

xml_tree = ET.parse(sys.argv[1])
xml_root = xml_tree.getroot()

xml_vars = [
    'x', 'y', 'width', 'height',
    'frameX', 'frameY', 'frameWidth', 'frameHeight'
]
factor = 0.8 # Change this to desired resize factor

for SubTexture in xml_root.findall('SubTexture'):
    for xml_var in xml_vars:
        resize(SubTexture, xml_var, factor)

xml_tree.write(sys.argv[1])