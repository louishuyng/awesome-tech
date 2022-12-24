import socket


def recvall(sock, length):
    data = b''
    while len(data) < length:
        more = sock.recv(length - len(data))
        if not more:
            raise EOFError('was expecting %d bytes but only received'
                           ' %d bytes before the socket closed'
                           % (length, len(data)))
        data += more
    return data


port = 3000
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
sock.bind(('127.0.0.1', port))
sock.listen(1)
print('Listening at', sock.getsockname())
while True:
    print('Waiting for a new connection')
    sc, sockname = sock.accept()
    print('Connection from', sockname)
    print('  Socket name:', sc.getsockname())
    print('  Socket peer:', sc.getpeername())
    message = recvall(sc, 16)
    print('  message from client:', repr(message))
    sc.sendall(b'Goodbye, client!')
    sc.close()
    print('Closing socket')
