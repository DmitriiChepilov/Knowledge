
## Windows 10 & Auto-tuning
[Windows — причина медленного интернета](https://habr.com/ru/articles/760256/)
```bash
netsh int tcp set global autotuninglevel=disabled
netsh int tcp set global autotuninglevel=normal
```