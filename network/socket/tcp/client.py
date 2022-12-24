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


host = '127.0.0.1'
port = 3000
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((host, port))
print('Client has been assigned the socket: ', sock.getsockname())
sock.sendall(b'Greetings, server')
reply = recvall(sock, 16)
print('Server: ', repr(reply))
sock.close()
