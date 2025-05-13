# GNU make does its work in two distinct phases. During the first phase it reads all the makefiles, included makefiles, etc. and internalizes all the variables and their values and implicit and explicit rules, and builds a dependency graph of all the targets and their prerequisites. During the second phase, make uses this internalized data to determine which targets need to be updated and run the recipes necessary to update them.
#
# The goals are the targets that make should strive ultimately to update. 
# Query the default goal.
ifeq ($(.DEFAULT_GOAL),)
  $(warning no default goal is set)
endif

.PHONY: all
all: foo bar # If .DEFAULT_GOAL is empty, it will be set to 'all'
	@echo 'all started: @='$@

$(warning default goal is $(.DEFAULT_GOAL))

# Reset the default goal.
.DEFAULT_GOAL := # comment this line out and see the difference

.PHONY: foo
foo: ; @echo 'foo started: @='$@ # If .DEFAULT_GOAL is empty, it will be set to 'foo'

$(warning default goal is $(.DEFAULT_GOAL))

# Reset the default goal.
.DEFAULT_GOAL :=

.PHONY: bar
bar: ; @echo 'bar started: @='$@

$(warning default goal is $(.DEFAULT_GOAL))

# Set our own goal to be executed in phase 2.
.DEFAULT_GOAL := bar # | foo | all
$(warning default goal is now $(.DEFAULT_GOAL))
