extern volatile DIRA;
extern volatile OUTA;

int main(int argc, char *argv[])
{

    DIRA |= 1;
    OUTA |= 1;

    while(1);

    return 0;

}

