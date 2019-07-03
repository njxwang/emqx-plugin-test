## shallow clone for speed
PROJECT = emqx_plugin_test
PROJECT_DESCRIPTION = EMQ X test Plugin
PROJECT_VERSION = 1.0

REBAR_GIT_CLONE_OPTIONS += --depth 1
export REBAR_GIT_CLONE_OPTIONS

REBAR = rebar3
all: compile

compile:
	$(REBAR) compile

ct: compile
	$(REBAR) as test ct -v

eunit: compile
	$(REBAR) as test eunit

xref:
	$(REBAR) xref

clean: distclean

distclean:
	@rm -rf _build
	@rm -f data/app.*.config data/vm.*.args rebar.lock