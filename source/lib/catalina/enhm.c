#include <hmi.h>

/*
 * HMI calls : enhanced mouse
 */

static int m_min[3];
static int m_max[3];
static int m_div[3];
static int m_acc[3];

void m_bound_limits(int xmin, int ymin, int zmin, int xmax, int ymax, int zmax) {
	m_min[0] = xmin;
	m_max[0] = xmax;
	m_min[1] = ymin;
	m_max[1] = ymax;
	m_min[2] = zmin;
	m_max[2] = zmax;
}

void m_bound_scales (int xscale, int yscale, int zscale) {
	m_div[0] = xscale;
	m_div[1] = yscale;
	m_div[2] = zscale;
}

int m_abs (int value) {
	if (value < 0) {
		return -value;
	}
	else {
		return value;
	}
}

void m_bound_preset (int xpreset, int ypreset, int zpreset) {
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

int m_limit (int i, int value) {
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

int m_bound (int i, int delta) {
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

int m_bound_x() {
	return m_bound(0, m_delta_x());
}

int m_bound_y() {
	return m_bound(1, m_delta_y());
}

int m_bound_z() {
	return m_bound(2, m_delta_z());
}

