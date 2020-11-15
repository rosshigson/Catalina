include ../Makefile.inc

all:	 \
	cgi_color_data.s \
	cgi_display_base.s \
	cgi_screen_data.s \
	cgi_x_tiles.s \
	cgi_y_tiles.s \
	g_arc.s \
	g_box.s \
	g_color.s \
	g_pallete.s \
	g_colorwidth.s \
	g_flush.s \
	g_finish.s \
	g_justify.s \
	g_line.s \
	g_pix.s \
	g_pixarc.s \
	g_plot.s \
	g_quad.s \
	g_mode.s \
	g_setup.s \
	g_db_setup.s \
	g_clear.s \
	g_copy.s \
	g_move.s \
	g_text.s \
	g_textarc.s \
	g_textmode.s \
	g_tri.s \
	g_vec.s \
	g_vecarc.s \
	g_width.s \
	gm_basic_mouse.s \
	gm_basic_mouse_2.s \
	gm_enhanced_mouse.s \
	gm_basic_mouse_z.s \
	gm_enhanced_mouse_z.s \
	gk_clear.s \
	gk_get.s \
	gk_initialize.s \
	gk_new.s \
	gk_present.s \
	gk_ready.s \
	gk_state.s \
	gk_wait.s
ifeq ($(COMPACT),TRUE)
	cp cgi_data_compact.e cgi_data.s
	cp g_setcommand_compact.e g_setcommand.s
	cp g_db_setcommand_compact.e g_db_setcommand.s
	cp g_sar_compact.e g_sar.s
	cp g_limit_compact.e g_limit.s
	cp rand_forward_compact.e rand_forward.s 
	cp rand_reverse_compact.e rand_reverse.s
else
	$(SPINPP) $(SPINPPFLAGS) cgi_data.e > cgi_data.s
	$(SPINPP) $(SPINPPFLAGS) g_setcommand.e > g_setcommand.s
	$(SPINPP) $(SPINPPFLAGS) g_db_setcommand.e > g_db_setcommand.s
	$(SPINPP) $(SPINPPFLAGS) g_sar.e > g_sar.s
	$(SPINPP) $(SPINPPFLAGS) g_limit.e > g_limit.s
	$(SPINPP) $(SPINPPFLAGS) rand_forward.e > rand_forward.s 
	$(SPINPP) $(SPINPPFLAGS) rand_reverse.e > rand_reverse.s
endif

clean:
	rm -f *.s
