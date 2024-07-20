class Origin {
 public:
  int o_value;
};
class A : public Origin {
 public:
  void method1 (void);
  virtual void method2 (int v);
  A();
  int   a_value;
};

