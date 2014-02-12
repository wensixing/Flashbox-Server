from xml.dom.minidom import parse, parseString, Node
from os.path import join, relpath, getsize
from os import walk

if __name__ == "__main__":
    flashgames = parse('DB.xml').getElementsByTagName('FlashGames')[0].getElementsByTagName('FlashGame')
    for flashgame in flashgames:
        fid = flashgame.getAttribute('id')
        pathbase = join('output/data', fid)
        dom = parseString('<Filelist></Filelist>')
        filelist = dom.firstChild
        totalsize = 0
        for root, dirs, files in walk(pathbase):
            for f in files:
                node = dom.createElement('File')
                node.setAttribute('path', relpath(join(root, f), start = pathbase))
                node.setAttribute('url', relpath(join(root, f), start = 'output'))
                totalsize += getsize(join(root,f))
                filelist.appendChild(node)
        filelist.setAttribute('size', str(totalsize))
        with open(join('output', 'xml', 'Filelist', '%s.xml' % fid), 'wb+') as f:
            f.write(dom.toprettyxml(encoding='UTF-8'))
