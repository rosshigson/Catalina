#include "c.h"

static char rcsid[] = "$Id: event.c 355 2007-02-18 22:08:49Z drh $";

struct entry {
	Apply func;
	void *cl;
};

Events events;
void attach(Apply func, void *cl, List *list) {
	struct entry *p;

	NEW(p, PERM);
	p->func = func;
	p->cl = cl;
	*list = append(p, *list);
}
void apply(List event, void *arg1, void *arg2) {
	if (event) {
		List lp = event;
		do {
			struct entry *p = lp->x;
			(*p->func)(p->cl, arg1, arg2);
			lp = lp->link;
		} while (lp != event);
	}
}

