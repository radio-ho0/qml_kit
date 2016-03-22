import QtQuick 2.0

Rectangle {
    id     : root
    width  : 800
    height : 600
    color  : "beige"

    property var img_prefix : "data:img/png;base64, "

    Image {
        id     : _bg
        width  : 296
        height : 187

        source : img_prefix + 
        'iVBORw0KGgoAAAANSUhEUgAAASgAAAC7CAMAAADhXPNyAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAClFBMVEUAAAD///87OzvExMTFxcWysrJOTk5PT0+xsbEpKSnV1dUBAQEoKCienp5iYmIvLy+urq7q6ur4+Pjb29uBgYEHBwchISGmpqbs7OzLy8tGRkZBQUHCwsL19fXBwcE/Pz/i4uIkJCTj4+MWFhanp6fv7+/r6+twcHAtLS3w8PDOzs5SUlJjY2OdnZ0aGhrf398GBgbk5ORoaGgcHBwJCQkxMTHDw8OGhoYeHh7m5uZ9fX0dHR0ODg5QUFDl5eU6Ojru7u5kZGQ3NzdcXFwKCgogICBUVFSqqqq8vLwUFBQYGBiVlZUVFRUXFxdnZ2fz8/MZGRmKiop2dnZaWlre3t6fn5+EhIStra2zs7Nvb29ycnJpaWmUlJTJycmHh4dxcXF4eHipqal1dXV3d3eJiYkPDw8RERECAgL9/f3n5+fg4OAfHx/MzMy7u7vHx8cuLi66uro4ODgiIiL7+/v8/PwICAjp6eltbW1lZWWAgIAFBQUNDQ20tLQ8PDy5ubkTExPR0dHGxsZbW1vy8vIMDAzPz8+NjY1ubm7X19dsbGy+vr4DAwM5OTlhYWF8fHzt7e0nJydgYGBmZmbU1NSXl5fh4eH6+vrT09P+/v5ERET29vZCQkLx8fEQEBAsLCz5+fnNzc1RUVH39/fc3NywsLCOjo5FRUVZWVkmJiYbGxuioqJzc3NISEhDQ0Pa2to9PT21tbXKyspJSUm/v79ra2tqamqhoaGcnJyRkZElJSX09PRHR0cjIyPo6OioqKgSEhLd3d1TU1MEBATW1talpaWjo6N0dHQrKytKSkrIyMhLS0vAwMALCwszMzPQ0NCkpKQqKiqZmZmgoKDZ2dlfX1+srKybm5tWVlYyMjJXV1evr693d/+VXz5wAAAAAWJLR0QB/wIt3gAAAAlvRkZzAAAABgAAAf4Ah47z1wAAAAl2cEFnAAAFVgAAAwAAn3vHHQAACMFJREFUeNrtnf1DFEUYx2f1KN4NFMQXTD1FUQwIxIiXIMUkjiAFBXxFBKUXSBTyLZTI0IrUCjIET4kUMzMNLU00KCXN3sze9J/p9o67mdmZ27s9Offu9vn8cAw7M8/efm9nbva5Z2YQAgAAAAAAAAAAAHwWQWPAJw4A3sOo0XR3ZacLk6aUw9RVsavQjVJex+8RZ969MCKX5zFCPeqvuEpAYJAGhQoKDFZaJSRUci1jHgsLHzsuwpSMHB8VPmGiPaEmTY6OnvI4WXXqNMvfyOlUrqCfMTNmFlV3tl9s+Jy5an5Lx81TWOGJ+ASJUIlPJiXPT1mA0FOpT6elZ2SO4Qv1TFaoXp+d9SxRdfxChBblILT4OSpXWJKd+3weWTcgM9SQ/0KBmkIlxBcqq/DiUmnrWGa+lCKEipeLqWUr+EKVlIqvZWRbX7kKodVjEVqzlsoV1knrlptz16s67qvYoKh45dR0qVBV4uvGTQhVR4opw0t8oaJeNreyMKLq7FdQ2qs1tei1zVSuUCetG2bJVVUo9soV6irY/myxDPc38YXaKvZiqH4L2UM2JL++bf12lJlA5Qo77NRV90mCaUsKWyoWKnUne5i5o2LIurveaNxdtyenic4VGCsNHnBHsb2zHJy+HwsV8iZxuPktSWqXpRfyo+7PBSUI7V36Np0rMFbGt6jfR7Hf93JwRhNYqKR9+9MScuJqzP+/U/bucIHh1BtZoQZD3Mz3yLqjCloRev/AYjqX0GO47sHph3L1HxSoLFTAh0FOl+WMT7FQqPCjtvawcstgaMzHh4dzrKlPRnd0pByhW3Jnl+n8QhKdS+hhrXvUr9N47Lja3g7JM4kco5CWkTzlAgAAAABgQbu/3AhuLQ5CgVAgFAgFQoFQIBQIBUKBUCAUCAVCgVAgFAgFQgEA4DHwfylO6y52sTnXj/vUGJhhSVdWCyp0CnX+zc09OfSx4u4k/tU7/0sxPzY2JHCRa5cY1JhXl1A7HODy2TwVhKpsq+iqWhe/kzq4KJAfsKkg9oAbG2swnkCuXeLJGTjdG3tKBaEqQsTXz0/TR78w7uaUlcZDy8GNjS2dLD0iZEwI79xVKybP+M80frk8AqGElpqG9tTySYiIHi45i+t8tUCqDBFvbLNC5B4/1h1bcpQuF+Df2X3uPF9hMgbZxpQz4uuJryVlm/p4DUdBfBQ3NrbnAiNU87Z8Q1x1gCm5emHhjsiL3yBU/m1vcsSlbU1k9HDi2cbLlyd/Z/4QoyoZoWzxxtiK5Byhib1kuSuJKwt3H8riC0XEIGMa9OJrfr+kbMsKtr6iiDtubGxbACNUmfhadtX6f1UsQh3XbH2lLXrY+H2rvmog9TxCgz/MYtoajjfGVqTnKP2RLHf9hvkYXygiBhnTPoh0KWiHUVJ2KJ6tryiGkxsb27GTEcr8NRLZYOqu+1YXCIJwGCFd409VllwcPdx+SEwt1pkuriiBFcoWb4ytSM+RU02W67cc4wtFxCBTQt3UsUKlRzt15XJwdOUIVS++ijG+G/bc0m80x/OeKu4X2n7enk5GD8fkiuWudSCUdZLtvXEsH7bCOwcut9VyTGrHMvmIiEF22PQ4QimMM+e1VE7Ts9xRpk/7wCUxVWt567d/ufDrEjJ6WGcTijfVEgtAWaHvqAayXH+dzB1FxCA77MzZpqd45gKn7+/p4/dRs0z9R0y+mMIjpPxoMnp4u7npDdTQyrBCSa3gc7RcJcv9ViEm1toRCscgE8csw4MbkqKlTGeueC4MJzaWMzzozNbntiYeRGiVX2/9739Emd76sdPzb0cE37lIRg8b/mw1dGVkZjgSClsxtyTLn2bTOe4mBpDlpqX2FV67G2ZHKByDTPQ8bUu7uqQDToRuSj97F2ZXseNTg3GiVKi5c4ydfuIYJ8L0jBLz10HTW9/8d3x7TM1+cVYCjh4O9o81zhlAjoTCVgihBvYOj9WIuOQhv+bucyc28d84EYOMueJX0NwTKSl5ixlwujBfj/PEwzzCPAzsj9uDix7Q9O19TDvTjUg8NPNQrJpQU/5JSv43Ze0Dmr7TnYZ8B65QR5Z0RDX950NXCQAAAAAAAAAA8HDhrRHlyykAAAAAAAAAAADAOZz//XXwnnBv0MVcH8DpX/SDrkdlH7ge5FKuL+B0jEhe5hAaSs1zKdcncDLqaE2RGCFWV7TGhVzfQHkcm1ZRGhmpWZTG2moXZdHbGkbZfAAto2SGiaZRsgKvtlEwC07bwAq8AODxwJZuAACogkOnsNx8G9uCDjrf3+rAoVNYbgaXbUEHVyaLeRmOnMLsIhQk1gUdXJl+6G04cArbZpni7eXIbeisCzoon9DqdThwClsXocDby1Hb0FkXdNCCa1neKWydCY+3l6O2obPNKteAa1neKWxdWwFvL0dtQ2dbp0ALrmVZp7BVKLy9HLUNHV7QQQOuZVmnsLXp4e3lqG3o8IIOWnAtyzmFrYtQ4O3lqG3oiAUdNOBalnMKW4cHeHs5ahs6YkEHLbiWZZzCtkUo8PZyxEZz1IIOGnAtyzmF5R5h6AUdNO5alnso9q0FHQBPRBgRQEcAAJxFHVewPcvmIYhnOp7VcQXbs2we1Hqk41ktVzDfsmXVYI90PLMLDlK4zxXMtTz84O2Jjmd2PWIK97mCeZatrhxPdDyzi6JSuM8VzLNscw56oOOZXWaXwn2uYI5lXsrrhBpxVzDHMu/e8rqmN+KuYNYyr7fyHHr6ZLPd5wpmLfO+/zwHB8MD97mCGcuSEZWnOZ7Z9YhJ3OcKZi3zxuiehDquYI5l3lOfJ6GOKxiczL4OOGwBAPBuBE5qZOyBUCAUCOUGobibyoFQLNxN5UAoFu6mciAUC3dTOY0J5dRqwNxN5eCO4sDbVA6E4sDbVA6E4sDbVA6E4sDdVA6EcsEeCAVCgVAgFAAAXsrI9FEj3dOBUCAUCAVCgVAgFAgFQoFQIBQIBUKBUCAUCAVCgVC+KhTgvdy/DxrY438qFRNTPsm8nwAAAABJRU5ErkJggg=='
       
    }
}


