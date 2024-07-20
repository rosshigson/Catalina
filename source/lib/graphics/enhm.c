#include <graphics.h>

/*
 * Graphics Mouse calls : enhanced mouse (X & Y)
 */

static int m_min[3];
static int m_max[3];
static int m_div[3];
static int m_acc[3];

void gm_bound_limits(int xmin, int ymin, int zmin, int xmax, int ymax, int zmax) {
	m_min[0] = xmin;
	m_max[0] = xmax;
	m_min[1] = ymin;
	m_max[1] = ymax;
	m_min[2] = zmin;
	m_max[2] = zmax;
}

void gm_bound_scales (int xscale, int yscale, int zscale) {
	m_div[0] = xscale;
	m_div[1] = yscale;
	m_div[2] = zscale;
}

int gm_abs (int value) {
	if (value < 0) {
		return -value;
	}
	else {
		return value;
	}
}

void gm_bound_preset (int xpreset, int ypreset, int zpreset) {
	int m_preset[3];
	int d;
	int i;
	m_preset[0] = xpreset;
	m_preset[1] = ypreset;
	m_preset[2] = zpreset;
	for (i = 0; i < 3; i++) {
		d = m_abs (m_div[i]);
		m_acc[i] = (m_preset[i] - m_min[i]) * d + d >> 1;
	}
}

int gm_limit (int i, int value) {
	int tmp = 0;
	if (value < 0) {
		return 0;
	}
	tmp = (m_max[i] - m_min[i] + 1) * m_abs(m_div[i]) - 1;
	if (value > tmp) {
		return tmp;
	}
	return value;
}

int gm_bound (int i, int delta) {
	int d = m_div[i];
	int tmp;
	if (d < 0) {
		m_acc[i] = m_limit (i, m_acc[i] - delta);
	}
	else {
		m_acc[i] = m_limit (i, m_acc[i] + delta);
	}
	return m_min[i] + (m_acc[i] / m_abs(d));
}

int gm_bound_x() {
	return m_bound(0, gm_delta_x());
}

int gm_bound_y() {
	return m_bound(1, gm_delta_y());
}


