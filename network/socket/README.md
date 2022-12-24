# Socket Demo

## Description
Network Socket Demo using python socket library

## How it works?
**On the server side**,
we create a socket on server side with specific port and ip address also type socket is dgram

**On the client side**, we create a socket and let os decide the port then send it to the socket that server is hosting. Then, it will show the prompt input in the term for you to type the text. Type any text you want and you will see the result through the log

## Running Server
```python
python3 server.py
```

## Running Client
```python
python3 client.py
```

- Show prompt input and you can type any message you want

## Running Multiple Host Client
```python
python3 client.py
```

- Show prompt input the host you want to send a message and receive a message
- Show prompt input and you can type any message you want


## The Result
### Server Log
```bash
Listening at ('127.0.0.1', 3000)
The client at ('127.0.0.1', 61277) says 'Test'
```

### Client Log

```bash
The OS assigned the address ('0.0.0.0', 0) to me
Input lowercase sentence:test
The OS assigned the address ('0.0.0.0', 61277) to me
The server ('127.0.0.1', 3000) replied with 'TEST'
```
