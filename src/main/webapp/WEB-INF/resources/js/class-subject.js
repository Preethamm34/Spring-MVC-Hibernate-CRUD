var schoolData = {

			"1st Standard" : {"Kannada":[], "English":[], "Hindi":[], "Maths":[], "Science":[], "Social":[],},
			"2nd Standard" : {"Kannada":[], "English":[], "Hindi":[], "Maths":[], "Science":[], "Social":[],},
			"3rd Standard" : {"Kannada":[], "English":[], "Hindi":[], "Maths":[], "Science":[], "Social":[],},
			"4th Standard" : {"Kannada":[], "English":[], "Hindi":[], "Maths":[], "Science":[], "Social":[],},
			"5th Standard" : {"Kannada":[], "English":[], "Hindi":[], "Maths":[], "Science":[], "Social":[],},
			"6th Standard" : {"Kannada":[], "English":[], "Hindi":[], "Maths":[], "Science":[], "Social":[],},
			"7th Standard" : {"Kannada":[], "English":[], "Hindi":[], "Maths":[], "Science":[], "Social":[],},
			"8th Standard" : {"Kannada":[], "English":[], "Hindi":[], "Maths":[], "Science":[], "Social":[],},
			"9th Standard" : {"Kannada":[], "English":[], "Hindi":[], "Maths":[], "Science":[], "Social":[],},
		   "10th Standard" : {"Kannada":[], "English":[], "Hindi":[], "Maths":[], "Science":[], "Social":[],},
  }


		window.onload = function() {
			var classList = document.getElementById("classList"), subjectList = document
					.getElementById("subjectList");
			
			for ( var classess in schoolData) {
				classList.options[classList.options.length] = new Option(
						classess, classess);
			}
			classess.onchange = function() {
				subjectList.length = 1;
				
				if (this.selectedIndex < 1)
					return;
				for ( var subjects in schoolData[this.value]) {
					subjectList.options[subjectList.options.length] = new Option(
							subjects, subjects);
				}
			};
			
		};


		
/*		<td><select id="classList" name="classess" class="form-select">
        <option value="" name="classess" selected="selected">Class</option>
		</select></td>
		
	<td><select id="subjectList" name="subjects" class="form-select">
        <option value="" name="subjects" selected="selected">Subjects</option>
		</select></td>*/
