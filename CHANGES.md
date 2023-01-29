# try_repeat 0.2.0 (2023-01-29)

* Use `"$@"` rather than `eval` to execute `<command>`. This preserves spaces
  in `<command>` (e.g. those contained in quotes), and thus, in general, tends
  to better match the user's expectations about what command will actually be
  executed.


# try_repeat 0.1.0 (2023-01-25)

* First release.
