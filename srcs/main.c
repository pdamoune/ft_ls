/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pdamoune <pdamoune@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/10/30 10:40:26 by pdamoune          #+#    #+#             */
/*   Updated: 2018/03/08 17:09:39 by pdamoune         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <ft_ls.h>

static t_cliopts	g_read_opts[] =
{
	{'h', "help", (1 << 0), 0, NULL, 0},
	{0, 0, 0, 0, 0, 0},
};

int		main(int ac, char **av)
{

	t_data_template	data;
	int fd;

	ft_bzero(&data, sizeof(t_data_template));
	if (cliopts_get(av, g_read_opts, &data))
		return (1);
	fd = open("/dev/ttys002", O_RDWR | O_NOCTTY | O_SYNC);
	ft_putnbrel(ft_dprintf(fd, "coucou"));
	return (0);
	(void)ac;
}
