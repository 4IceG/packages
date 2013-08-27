#!/usr/bin/haserl
<?
	# This program is copyright © 2008-2013 Eric Bishop and is distributed under the terms of the GNU GPL
	# version 2.0 with a special clarification/exception that permits adapting the program to
	# configure proprietary "back end" software provided that all modifications to the web interface
	# itself remain covered by the GPL.
	# See http://gargoyle-router.com/faq.html#qfoss for more information

	eval $( gargoyle_session_validator -c "$COOKIE_hash" -e "$COOKIE_exp" -a "$HTTP_USER_AGENT" -i "$REMOTE_ADDR" -r "login.sh" -t $(uci get gargoyle.global.session_timeout) -b "$COOKIE_browser_time"  )
	gargoyle_header_footer -h -s "status" -p "3ginfo" -c "internal.css" -j "3ginfo.js" -i 3ginfo
?>

<fieldset>
	<legend class="sectionheader">Modem 3G/LTE</legend>

	<div>
		<label id="list_device_label" class="leftcolumn" for="list_device">Urządzenie:</label>
		<span class='rightcolumn'>
			<select id="list_device" onchange='setDevice(this.value)' >
			<option value=''>brak</option>
			<?
				devices=$(ls -1 /dev/tty[A\|U][C\|S]* 2>/dev/null)
				for d in $devices; do
					echo "<option value='$d'>$d</option>"
				done
			?>
			</select>
		</span>
	</div>

	<div>
		<span class='leftcolumn'>Status połączenia:</span><span id="status" class='rightcolumn'>-</span>
	</div>
	<div>
		<span class='leftcolumn'>Czas połączenia:</span><span id="conn_time" class='rightcolumn'>-</span>
	</div>
	<div>
		<span class='leftcolumn'>Pobrano danych:</span><span id="rx" class='rightcolumn'>-</span>
	</div>
	<div>
		<span class='leftcolumn'>Wysłano danych:</span><span id="tx" class='rightcolumn'>-</span>
	</div>
	<div>
		<span class='leftcolumn'>Operator:</span><span id="cops" class='rightcolumn'>-</span>
	</div>
	<div>
		<span class='leftcolumn'>Siła sygnału:</span><span id="csq_per" class='rightcolumn'>-</span>
	</div>

	<div>
		<span class='leftcolumn'>Tryb pracy:</span><span id="mode" class='rightcolumn'>-</span>
	</div>

	<div class="internal_divider"></div>

	<center>
		<table border=0>
		<tr>
			<td height="50">
				<span id="gcops" style="font-size:2em;">-</span>
			</td>
			<td rowspan="3">
				<img id="s0p" src="img/signal0.png" style="display: block;">
				<img id="s10p" src="img/signal10.png" style="display: none;">
				<img id="s20p" src="img/signal20.png" style="display: none;">
				<img id="s30p" src="img/signal30.png" style="display: none;">
				<img id="s40p" src="img/signal40.png" style="display: none;">
				<img id="s50p" src="img/signal50.png" style="display: none;">
				<img id="s60p" src="img/signal60.png" style="display: none;">
				<img id="s70p" src="img/signal70.png" style="display: none;">
				<img id="s80p" src="img/signal80.png" style="display: none;">
				<img id="s90p" src="img/signal90.png" style="display: none;">
				<img id="s100p" src="img/signal100.png" style="display: none;">
			</td>
		</tr>
		<tr>
			<td>
				<span id="gmode" style="font-size:1.5em;">-</span>
			</td>
		</tr>
		<tr>
			<td>
				<span id="gcsq_per" style="font-size:1.5em;">-</span>
			</td>
		</tr>
		</table>
	</center>

	<div class="internal_divider"></div>

	<div>
		<span class='leftcolumn'>MCC MNC:</span><span class='rightcolumn'><span id="cops_mcc" >-</span>&nbsp<span id="cops_mnc" >-</span></span>
	</div>
	<div>
		<span class='leftcolumn'>CSQ:</span><span id="csq" class='rightcolumn'>-</span>
	</div>
	<div>
		<span class='leftcolumn'>RSSI:</span><span id="csq_rssi" class='rightcolumn'>-</span>
	</div>
	<div id="qos_container">
		<span class='leftcolumn'>Profil UMTS QoS:</span><span id="qos" class='rightcolumn'>-</span>
	</div>
	<div>
		<span class='leftcolumn'>LAC:</span><span id="lac" class='rightcolumn'>-</span>
	</div>
	<div id="lcid_container">
		<span class='leftcolumn'>LCID:</span><span id="lcid" class='rightcolumn'>-</span>
	</div>
	<div id="rnc_container">
		<span class='leftcolumn'>RNC:</span><span id="rnc" class='rightcolumn'>-</span>
	</div>
	<div>
		<span class='leftcolumn'>CID:</span><span id="cid" class='rightcolumn'>-</span>
	</div>
	<div>
		<span class='leftcolumn'>Typ modemu:</span><span id="device" class='rightcolumn'>-</span>
	</div>

</fieldset>

<script>
<!--
	resetData();
	setInterval("resetData()", 30000);
//-->
</script>

<?
	gargoyle_header_footer -f -s "status" -p "3ginfo"
?>
