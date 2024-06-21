# Account/Scrpiting Examples 

To see the test pass using the work around, run:

```bash
forge test
```

To see the test fail, with the error, uncomment the code under `START IDEAL CODE` and before `END IDEAL CODE` and comment out the code under `START WORK AROUND` and before `END WORK AROUND`. Then run:

```bash
forge test
```

And you'll get:
```
[FAIL. Reason: no wallets are available] testGetV() (gas: 7961)
```

