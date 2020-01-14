					<button onclick="window.print()" class="float-right d-print-none btn btn-sm btn-success"><i class="fa fa-print"></i></button>
					<div class="input-group input-group-sm float-right mx-1" style="width: 100px;">
						<div class="input-group-prepend">
							<span class="input-group-text">Font</span>
						</div>
						<select id="font" class="form-control" onchange="change_font_size(this)">
							<option value="8">8</option>
							<option value="10">10</option>
							<option value="12" selected="selected">12</option>
							<option value="14">14</option>
							<option value="18">18</option>
							<option value="22">22</option>
						</select>
					</div>
					<div class="input-group input-group-sm float-right mx-1" style="width: 150px;">
						<div class="input-group-prepend">
							<span class="input-group-text">Weight</span>
						</div>
						<select id="font" class="form-control" onchange="bold_font(this)">
							<option value="1">Normal</option>
							<option value="2">Bold</option>
						</select>
					</div>
					<div class="input-group input-group-sm float-right mx-1" style="width: 100px;">
						<div class="input-group-prepend">
							<span class="input-group-text">Cols</span>
						</div>
						<select id="cols" class="form-control" onchange="change_cols(this)">
							<option value="2">2</option>
							<option value="3" selected="selected">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
						</select>
					</div>