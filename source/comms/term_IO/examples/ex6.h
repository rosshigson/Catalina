

class Origin {
 public:
  int o_value;
};

class A : public Origin {
 public:
  void non_virtual (void);
  virtual void overridden (void);
  virtual void not_overridden (void);
  A();
  int   a_value;
};

class B : public A {
 public:
  virtual void overridden (void);
  B();
  int b_value;
};
