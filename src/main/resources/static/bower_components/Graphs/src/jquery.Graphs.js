var graphs = {
	fontsize: 20,
	fontfamily: 'Arial',
	fontcolor: '#333333',
	colorsetname: 'default',
	colorset: null,
	fontweight: 'normal',
	bacakgroundcolor: 'transparent',

	init: function () {
		// Only init if a graph is detected.
		if ($('.canvasjs').length > 0) {

			if ($('.canvasjs-settings').length > 0) {
				$colorset = $('.canvasjs-settings').data('colorset');
				graphs.colorsetname = $('.canvasjs-settings').data('colorsetname');
				graphs.createColorset($colorset);
				graphs.bacakgroundcolor = $('.canvasjs-settings').data('bacakgroundcolor');
				graphs.fontsize = $('.canvasjs-settings').data('fontsize');
				graphs.fontfamily = $('.canvasjs-settings').data('fontfamily');
				graphs.fontcolor = $('.canvasjs-settings').data('fontcolor');
				graphs.fontweight = $('.canvasjs-settings').data('fontweight');
			}

			// Loop through all the graphs and render them
			$('.canvasjs').each(function (i) {
				if ($(this).data('graphtype') === 'IncompleteDonut') {
					graphs.drawIncompleteDonut($(this).attr('id'), $(this).data('value'), $(this).data('color'));
				} else {
					if ($(this).attr('data-stats') !== undefined) {
						graphs.draw($(this).attr('id'), $(this).data('graphtype'), $(this).data('stats'), $(this).data('title'));
					} else {
						graphs.drawAlternate($(this).attr('id'), $(this).data('graphtype'), $(this).data('title'));
					}
				}
			});
		}
	},

	createColorset: function (colors) {
		$colors = colors.split(',');
		$colorSetString = [];
		$.each($colors, function (index, val) {
			$colorSetString.push('' + val + '');
		});
		graphs.colorset = $colorSetString;
	},

	drawAlternate: function (graphid, graphtype, title) {
		var graphdata=[];
		$('#'+graphid).find('div.graphdata').each(function (i) {
			var stats = {
				label: $(this).data('label'),
			};
			if ($(this).attr('data-color') !== undefined) {
				stats.color = $(this).data('color');
			}

			if ($(this).attr('data-y') !== undefined) {
				stats.y = $(this).data('y');
			}

			if ($(this).attr('data-x') !== undefined) {
				stats.x = $(this).data('x');
			}
			graphdata.push(stats);
		});
		var jsongraphdata = JSON.stringify(graphdata);

		CanvasJS.addColorSet(graphs.colorsetname, graphs.colorset);

		var chart = new CanvasJS.Chart(graphid, {
			backgroundColor: graphs.bacakgroundcolor,
			colorSet: graphs.colorsetname,
			title: {
				text: title,
				fontSize: graphs.fontsize,
				fontFamily: graphs.fontfamily,
				fontColor: graphs.fontcolor,
				fontWeight: graphs.fontweight
			},
			data: [{
				type: graphtype,
				startAngle: 20,
				dataPoints: $.parseJSON(jsongraphdata)
			}]
		});

		chart.render();
	},

	draw: function (graphid, graphtype, indataurl, title) {
		$ajaxCall = $.ajax({
			url: indataurl,
			dataType: 'json'
		});
		$ajaxCall.done(function (response) {
			CanvasJS.addColorSet(graphs.colorsetname, graphs.colorset);

			var chart = new CanvasJS.Chart(graphid, {
				backgroundColor: graphs.bacakgroundcolor,
				colorSet: graphs.colorsetname,
				title: {
					text: title,
					fontSize: graphs.fontsize,
					fontFamily: graphs.fontfamily,
					fontColor: graphs.fontcolor,
					fontWeight: graphs.fontweight
				},
				data: [{
					type: graphtype,
					startAngle: 20,
					dataPoints: response
				}]
			});

			chart.render();
		});

		$ajaxCall.fail(function () {
			$('#graphid').html('Unable to draw graph. Msg: ' + $ajaxCall.responseText);
		});
	},

	// Only used to draw an incomplete donut, so only pass ONE value to this
	drawIncompleteDonut: function (graphid, value, color) {
		var chart = new CanvasJS.Chart(graphid, {
			backgroundColor: graphs.bacakgroundcolor,
			toolTip: {
				enabled: false,
			},
			data: [{
				type: 'doughnut',
				startAngle: 90,
				dataPoints: [{
					y: value,
					indexLabel: null,
					color: color
				}, {
					y: (100 - value),
					indexLabel: null,
					color: graphs.bacakgroundcolor
				}]
			}]
		});

		chart.render();
		$('#' + graphid + '-total').html(value + '%');
	}
};
