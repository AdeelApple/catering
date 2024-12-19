<?php if ($pages) {


	$pgrange = 5;
	if (isset($_GET['page'])) {
		$pgno = intval($_GET['page']);
	} else {
		$pgno = 1;
	}

	if ($pgrange * 2 < $pages) {

		if ($pgno - $pgrange < 1) {
			$pgend = $pgrange * 2;
			$pgstart = 1;
		} else if ($pgno > ($pages - $pgrange)) {
			$pgstart = $pgno - (($pgno - ($pages - $pgrange)) + $pgrange);
			$pgend = $pages;
		} else {
			$pgstart = $pgno - $pgrange;
			$pgend = $pgno + $pgrange;
		}
	} else {
		$pgstart = 1;
		$pgend = $pages;
	}

	$pglink = $_SERVER['PHP_SELF'] . "?page=";
	?>

	<nav aria-label="Page navigation example" class="d-print-none">
		<ul class="pagination mb-0">
			<li class="page-item <?php if ($pgno == 1)
				echo 'disabled'; ?>">
				<a class="page-link" href="<?= $pglink . ($pgno - 1) ?>" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
					<span class="sr-only">Previous</span>
				</a>
			</li>
			<?php for ($i = $pgstart; $i <= $pgend; $i++) { ?>
				<li class="page-item<?php if ($pgno == $i)
					echo " active"; ?>"><a class="page-link"
						href="<?= $pglink . $i ?>"><?= $i ?></a></li>
			<?php } ?>
			<li class="page-item <?php if ($pgno >= $pages)
				echo 'disabled'; ?>">
				<a class="page-link" href="<?= $pglink . ($pgno + 1) ?>" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					<span class="sr-only">Next</span>
				</a>
			</li>
		</ul>
	</nav>

<?php } ?>