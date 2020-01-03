#!/usr/bin/python3
"Generates a .tgz"

from datetime import datetime
import tarfile
import os


def do_pack():
    """ Create tar """
    directory = "versions/"
    namefile = "web_static_" + datetime.now().strftime("%Y%m%d%H%M%S") + ".tgz"
    if not os.path.exists(directory):
        os.mkdir(directory)
    with tarfile.open(directory + namefile, "w:gz") as tar:
        tar.add("web_static", arcname=os.path.basename("web_static"))
    if os.path.exists(directory + namefile):
        return directory + namefile
    else:
        return None
