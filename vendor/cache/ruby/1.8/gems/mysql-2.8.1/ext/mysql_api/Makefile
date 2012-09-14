
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = /home/webwerks/.rvm/rubies/ruby-1.8.7-p370/lib/ruby/1.8/i686-linux
hdrdir = $(topdir)
VPATH = $(srcdir):$(topdir):$(hdrdir)
prefix = $(DESTDIR)/home/webwerks/.rvm/rubies/ruby-1.8.7-p370
exec_prefix = $(prefix)
vendorlibdir = $(vendordir)/$(ruby_version)
datarootdir = $(prefix)/share
localedir = $(datarootdir)/locale
sitearchdir = $(sitelibdir)/$(sitearch)
psdir = $(docdir)
vendorarchdir = $(vendorlibdir)/$(sitearch)
dvidir = $(docdir)
pdfdir = $(docdir)
sitedir = $(libdir)/ruby/site_ruby
oldincludedir = $(DESTDIR)/usr/include
libexecdir = $(exec_prefix)/libexec
libdir = $(exec_prefix)/lib
archdir = $(rubylibdir)/$(arch)
vendordir = $(libdir)/ruby/vendor_ruby
mandir = $(datarootdir)/man
htmldir = $(docdir)
docdir = $(datarootdir)/doc/$(PACKAGE)
sitelibdir = $(sitedir)/$(ruby_version)
includedir = $(prefix)/include
rubylibdir = $(libdir)/ruby/$(ruby_version)
sharedstatedir = $(prefix)/com
sysconfdir = $(prefix)/etc
bindir = $(exec_prefix)/bin
infodir = $(datarootdir)/info
localstatedir = $(prefix)/var
datadir = $(datarootdir)
sbindir = $(exec_prefix)/sbin

CC = gcc
LIBRUBY = $(LIBRUBY_SO)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = -Wl,-R -Wl,$(libdir) -L$(libdir) -l$(RUBY_SO_NAME)
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)-static

RUBY_EXTCONF_H = 
CFLAGS   =  -fPIC -g -O2  -fPIC $(cflags) 
INCFLAGS = -I. -I. -I/home/webwerks/.rvm/rubies/ruby-1.8.7-p370/lib/ruby/1.8/i686-linux -I.
DEFS     = -D_FILE_OFFSET_BITS=64
CPPFLAGS = -DHAVE_MYSQL_SSL_SET -DHAVE_RB_STR_SET_LEN -DHAVE_RB_THREAD_START_TIMER -DHAVE_MYSQL_H  -D_FILE_OFFSET_BITS=64  -I/usr/include/mysql  -DBIG_JOINS=1  -fno-strict-aliasing   -DUNIV_LINUX -DUNIV_LINUX
CXXFLAGS = $(CFLAGS) 
ldflags  = -L.  -rdynamic -Wl,-export-dynamic
dldflags = 
archflag = 
DLDFLAGS = $(ldflags) $(dldflags) $(archflag)
LDSHARED = $(CC) -shared
AR = ar
EXEEXT = 

RUBY_INSTALL_NAME = ruby
RUBY_SO_NAME = ruby
arch = i686-linux
sitearch = i686-linux
ruby_version = 1.8
ruby = /home/webwerks/.rvm/rubies/ruby-1.8.7-p370/bin/ruby
RUBY = $(ruby)
RM = rm -f
MAKEDIRS = mkdir -p
INSTALL = /usr/bin/install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp

#### End of system configuration section. ####

preload = 

libpath = . $(libdir)
LIBPATH =  -L. -L$(libdir) -Wl,-R$(libdir)
DEFFILE = 

CLEANFILES = mkmf.log
DISTCLEANFILES = 

extout = 
extout_prefix = 
target_prefix = 
LOCAL_LIBS = 
LIBS = $(LIBRUBYARG_SHARED) -Wl,-Bsymbolic-functions -rdynamic -L/usr/lib/mysql -lmysqlclient  -lrt -ldl -lcrypt -lm   -lc
SRCS = mysql.c
OBJS = mysql.o
TARGET = mysql_api
DLLIB = $(TARGET).so
EXTSTATIC = 
STATIC_LIB = 

BINDIR        = $(bindir)
RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR = /home/webwerks/Desktop/uploadtowww/college/vendor/cache/ruby/1.8/gems/mysql-2.8.1/lib$(target_prefix)
RUBYARCHDIR = /home/webwerks/Desktop/uploadtowww/college/vendor/cache/ruby/1.8/gems/mysql-2.8.1/lib$(target_prefix)

TARGET_SO     = $(DLLIB)
CLEANLIBS     = $(TARGET).so $(TARGET).il? $(TARGET).tds $(TARGET).map
CLEANOBJS     = *.o *.a *.s[ol] *.pdb *.exp *.bak

all:		$(DLLIB)
static:		$(STATIC_LIB)

clean:
		@-$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES)

distclean:	clean
		@-$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		@-$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)

realclean:	distclean
install: install-so install-rb

install-so: $(RUBYARCHDIR)
install-so: $(RUBYARCHDIR)/$(DLLIB)
$(RUBYARCHDIR)/$(DLLIB): $(DLLIB)
	$(INSTALL_PROG) $(DLLIB) $(RUBYARCHDIR)
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
$(RUBYARCHDIR):
	$(MAKEDIRS) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .cxx .cpp .C .o

.cc.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cxx.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cpp.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.C.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.c.o:
	$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) -c $<

$(DLLIB): $(OBJS) Makefile
	@-$(RM) $@
	$(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)



$(OBJS): ruby.h defines.h
