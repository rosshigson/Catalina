#ifndef vtdcs_h
#define vtdcs_h

struct tbl_rec
{
  PA_UCHAR ch1;
  PA_UCHAR ch2;
  PA_INT arg0;
  PA_INT iFunc;
};

extern const PA_SHORT keytbl[];
extern const PA_SHORT citbl[];
extern const PA_SHORT citbl_count;
extern const unsigned char decimal[];

PA_INT cmpCSI( const struct CSItbl_rec *a, const struct CSItbl_rec *b );

void PASCAL Process_DECDLD( PS ps );
void PASCAL Process_DECUDK( PS ps );
void PASCAL Process_DECRQSS( PS ps );
void PASCAL Process_DECAUPSS( PS ps );
void PASCAL Process_DECRSTS( PS ps );
void PASCAL Process_DECDMAC( PS ps );
void PASCAL Process_DECRSPS( PS ps );
void PASCAL Process_DECRSCI( PS ps );
void PASCAL Process_DECRSTAB( PS ps );

#endif
