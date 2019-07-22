# pscid issue #60

How to reproduce:

1. `bower install` then `pulp build`
2. start `pscid`
3. Open `src/Types.purs`

Comment or uncomment this line

```
derive instance eqV :: Eq V
```

4. Open `src/App.purs`

Add or remove a blank line to trigger `pscid` rebuild.

## Expected behavior

Without the `Eq` instance, `pscid` should show error message.

With the `Eq` instance, `pscid` should show no error message.

## Actual behavior

The changes of `Types.purs` is not reflected in `App.purs` unless I type `r` in pscid.

Sometimes I need to repeat step 3 and 4 a few times to reproduce this issue.
