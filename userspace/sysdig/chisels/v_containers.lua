--[[
Copyright (C) 2013-2014 Draios inc.
 
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 2 as
published by the Free Software Foundation.


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

view_info = 
{
	id = "containers",
	name = "Containers",
	description = "List all the containers running on this machine, and the resources that each of them uses.",
	tips = {"Select a container and click enter to drill down into it. At that point, you will be able to access several views that will show you the details of the selected container."},
	view_type = "table",
	applies_to = {"", "evt.res"},
	filter = "container.name != host",
	use_defaults = true,
	drilldown_target = "procs",
	columns = 
	{
		{
			name = "NA",
			field = "thread.tid",
			is_key = true
		},
		{
			name = "CPU",
			field = "thread.cpu",
			description = "Amount of CPU used by the container.",
			colsize = 8,
			aggregation = "AVG",
			groupby_aggregation = "SUM",
			is_sorting = true
		},
		{
			name = "PROCS",
			field = "evt.count.procinfo",
			description = "Number of processes currently running inside the container.",
			aggregation = "AVG",
			groupby_aggregation = "SUM",
			colsize = 8,
		},
		{
			name = "THREADS",
			field = "evt.count.threadinfo",
			description = "Number of threads currently running inside the container.",
			aggregation = "AVG",
			groupby_aggregation = "SUM",
			colsize = 8
		},
		{
			name = "VIRT",
			field = "thread.vmsize",
			description = "total virtual memory for the process (as kb).",
			aggregation = "MAX",
			groupby_aggregation = "SUM",
			colsize = 9
		},
		{
			name = "RES",
			field = "thread.vmrss",
			description = "resident non-swapped memory for the process (as kb).",
			aggregation = "MAX",
			groupby_aggregation = "SUM",
			colsize = 9
		},
		{
			name = "FILE",
			field = "evt.buflen.file",
			description = "Total (input+output) file I/O bandwidth generated by the container, in bytes per second.",
			colsize = 8,
			aggregation = "TIME_AVG",
			groupby_aggregation = "SUM"
		},
		{
			name = "NET",
			field = "evt.buflen.net",
			description = "Total (input+output) network bandwidth generated by the container, in bytes per second.",
			colsize = 8,
			aggregation = "TIME_AVG",
			groupby_aggregation = "SUM"
		},
		{
			name = "NA",
			field = "container.id",
			is_groupby_key = true
		},
		{
			name = "IMAGE",
			field = "container.image",
			description = "Container image name.",
			colsize = 25
		},
		{
			name = "ID",
			field = "container.id",
			description = "Container ID. The format of this column depends on the containerization technology. For example, Docker ID are 12 characters hexadecimal digit strings.",
			colsize = 13
		},
		{
			name = "NAME",
			field = "container.name",
			description = "Name of the container.",
			colsize = 0
		},
	},
	actions = 
	{
		{
			hotkey = "a",
			command = "docker attach %container.id",
			description = "attach"
		},
		{
			hotkey = "l",
			command = "docker logs %container.id",
			description = "logz"
		},
		{
			hotkey = "b",
			command = "docker exec -i -t %container.id /bin/bash",
			description = "exec bash"
		},
	},
}
