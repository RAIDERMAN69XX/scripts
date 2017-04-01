import sys

domains = []
try:
    for line in open('domains.txt').read().split('\n'):
        line = line.strip()
        if line and not line.startswith('#'):
            domains.append(line)
except:
    sys.stderr.write('Warning: domains.txt not found!\n')
data = ','.join(map(lambda x: 'DNS:' + x, domains))
sys.stdout.write('[SAN]\nsubjectAltName=' + data + '\n')
