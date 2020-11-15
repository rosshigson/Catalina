
for %%i in (isalnum isalpha iscntrl isdigit isgraph islower isprint ispunct isspace isupper isxdigit isascii) do sed "s/xxxx/%%i/" > %%i.c proto.c
