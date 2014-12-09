<%@ page language="java"
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="Header.jsp" %>



<c:if test="${ empty sessionScope.alertType }">

	<div id="json-variables">
	{
		"firstInspectorID": 1,
		"secondInspectorID": 2,
		"studentID": ${ student.getStudent_id() },
		"supervisorID": ${ supervisor.getInspector_id() },
		"suggestedInspectors": [
		<c:forEach items="${ suggestedInspectors }" var="inspector" varStatus="inspectorStatus">
			{
				"id": "${ inspector.getInspector_id() }",
				"name": "${ inspector.getFullName() }",
				"username": "${ inspector.getUsername() }",
				"keywords": "Web, network",
				"load": 0,
				"capacity": ${ inspector.getCapacity() }
			}
			<c:if test="${ inspectorStatus.index < suggestedInspectors.size() - 1 }">
			,
			</c:if>
		</c:forEach>
		],
		"otherInspectors": [
		<c:forEach items="${ otherInspectors }" var="inspector" varStatus="inspectorStatus">
			{
				"id": "${ inspector.getInspector_id() }",
				"name": "${ inspector.getFullName() }",
				"username": "${ inspector.getUsername() }",
				"keywords": "Web, network",
				"load": 0,
				"capacity": ${ inspector.getCapacity() }
			}
			<c:if test="${ inspectorStatus.index < otherInspectors.size() - 1 }">
			,
			</c:if>
		</c:forEach>
		]
	}
	</div>
	
	<form class="form-horizontal" role="form" method="post">
	
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">Project informations</h3>
		  </div>
		  <div class="panel-body">
	  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Student</label>
			    <div class="col-sm-10">
			      <p class="form-control-static">${ student.getFullName() }</p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Title</label>
			    <div class="col-sm-10">
			      <p class="form-control-static">${ student.getProject_title() }</p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Description</label>
			    <div class="col-sm-10">
			      <p class="form-control-static">${ student.getProject_description() }</p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Keywords</label>
			    <div class="col-sm-10">
			      <p class="form-control-static">${ keywords }</p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">Supervisor</label>
			    <div class="col-sm-10">
			      <p class="form-control-static">${ supervisor.getFullName() }</p>
			    </div>
			  </div>
				
			</div> <!-- end panel body -->
		</div>
		
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">First inspector</h3>
		  </div>
		  <div class="panel-body">
			  Select an inspector below to be the first inspector.
			</div> <!-- end panel body -->
			<table class="table">
				<thead>
					<tr>
						<th class="radio-cell">Selection</th>
						<th>Inspector</th>
						<th>Matching</th>
						<th>Capacity</th>
					</tr>
				</thead>
				<tbody>
					<!-- ko foreach: suggestedInspectors -->	
						<tr>
							<td class="radio-cell">
								<input type="radio" name="inputFirstInspector" data-bind="checkedValue: $data, checked: $root.firstInspector">
							</td>
							<td data-bind="text: name"></td>
							<td data-bind="text: keywords"></td>
							<td data-bind="text: formattedCapacity()"></td>
						</tr>
					<!-- /ko -->
					<tr>
						<td class="radio-cell last">
							<input type="radio" name="inputFirstInspector" data-bind="checkedValue: $root.firstOtherInspector(), checked: $root.firstInspector">
						</td>
						<td colspan="3">
							<select  class="form-control" data-bind="options: otherInspectors,
																	value: firstOtherInspector,
																	optionsText: 'name'">
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">Second inspector</h3>
		  </div>
		  <div class="panel-body">
			  Select an inspector below to be the second inspector.
			</div> <!-- end panel body -->
			<table class="table">
				<thead>
					<tr>
						<th class="radio-cell">Selection</th>
						<th>Inspector</th>
						<th>Matching</th>
						<th>Capacity</th>
					</tr>
				</thead>
				<tbody>
					<!-- ko foreach: suggestedInspectors -->	
						<tr>
							<td class="radio-cell">
								<input type="radio" name="inputSecondInspector" data-bind="checkedValue: $data, checked: $root.secondInspector">
							</td>
							<td data-bind="text: name"></td>
							<td data-bind="text: keywords"></td>
							<td data-bind="text: formattedCapacity()"></td>
						</tr>
					<!-- /ko -->
					<tr>
						<td class="radio-cell last">
							<input type="radio" name="inputSecondInspector" data-bind="checkedValue: $root.secondOtherInspector(), checked: $root.secondInspector">
						</td>
						<td colspan="3">
							<select  class="form-control" data-bind="options: otherInspectors,
																	value: secondOtherInspector,
																	optionsText: 'name'">
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">Date</h3>
		  </div>
		  <div class="panel-body">
			<div id="calendar"></div>
		  </div> <!-- end panel body -->
				
			<table class="table">
				<thead>
					<tr>
						<th>Person</th>
						<th>Role</th>
						<th>Available</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="text-info">
					    	<span class="glyphicon glyphicon-calendar"></span>
					    	<span>${ student.getFullName() }</span>
					    </td>
					    <td>
					    	Student
					    </td>
					    <td>
					    	<span class="glyphicon glyphicon-ok text-success" data-bind="visible: studentIsAvailable()"></span>
					    	<span class="glyphicon glyphicon-remove text-danger" data-bind="visible: !studentIsAvailable()"></span>
					    </td>
					</tr>
					<tr>
						<td class="text-danger">
					    	<span class="glyphicon glyphicon-calendar"></span>
					    	<span>${ supervisor.getFullName() }</span>
					    </td>
					    <td>
					    	Spervisor
					    </td>
					    <td>
					    	<span class="glyphicon glyphicon-ok text-success" data-bind="visible: supervisorIsAvailable()"></span>
					    	<span class="glyphicon glyphicon-remove text-danger" data-bind="visible: !supervisorIsAvailable()"></span>
					    </td>
					</tr>
					<tr>
						<td class="text-warning" data-bind="with: firstInspector">
					    	<span class="glyphicon glyphicon-calendar"></span>
					    	<span data-bind="text: name"></span>
					    </td>
					    <td>
					    	First inspector
					    </td>
					    <td>
					    	<span class="glyphicon glyphicon-ok text-success" data-bind="visible: firstInspectorIsAvailable()"></span>
					    	<span class="glyphicon glyphicon-remove text-danger" data-bind="visible: !firstInspectorIsAvailable()"></span>
					    </td>
					</tr>
					<tr>
						<td class="text-success" data-bind="with: secondInspector">
					    	<span class="glyphicon glyphicon-calendar"></span>
					    	<span data-bind="text: name"></span>
					    </td>
					    <td>
					    	Second inspector
					    </td>
					    <td>
					    	<span class="glyphicon glyphicon-ok text-success" data-bind="visible: secondInspectorIsAvailable()"></span>
					    	<span class="glyphicon glyphicon-remove text-danger" data-bind="visible: !secondInspectorIsAvailable()"></span>
					    </td>
					</tr>
				</tbody>
			</table>
		</div>
	  
	  <div class="form-group">
	    <div class="pull-right">
	      <button type="submit" id="submitButton" class="btn btn-primary margin-14">Save</button>
	    </div>
	  </div>
	</form>
</c:if>

<%@ include file="Footer.jsp" %>