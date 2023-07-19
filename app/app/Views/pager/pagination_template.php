<?php if ($pager->getPageCount() > 1) { ?>
<?php $pager->setSurroundCount(2) ?>

<nav aria-label="Page navigation" class="dataTables_paginate paging_simple_numbers pull-right">
    <ul class="pagination">
        <?php if ($pager->hasPrevious()) : ?>
        <li>
            <a href="<?php echo $pager->getFirst() ?>" aria-label="<?php echo lang('Pager.first') ?>" class="page-link">
                <span aria-hidden="true"><?php echo lang('Pager.first') ?></span>
            </a>
        </li>
        <li>
            <a href="<?php echo $pager->getPreviousPage() ?>" aria-label="<?php echo lang('Pager.previous') ?>"
                class="page-link">
                <span aria-hidden="true"><?php echo lang('Pager.previous') ?></span>
            </a>
        </li>
        <?php endif ?>

        <?php foreach ($pager->links() as $link) : ?>
        <li <?php echo $link['active'] ? 'class="active paginate_button page-item"' : '' ?>>
            <a href="<?php echo $link['uri'] ?>" class="page-link">
                <?php echo $link['title'] ?>
            </a>
        </li>
        <?php endforeach ?>

        <?php if ($pager->hasNext()) : ?>
        <li>
            <a href="<?php echo $pager->getNextPage() ?>" aria-label="<?php echo lang('Pager.next') ?>"
                class="page-link">
                <span aria-hidden="true"><?php echo lang('Pager.next') ?></span>
            </a>
        </li>
        <li>
            <a href="<?php echo $pager->getLast() ?>" aria-label="<?php echo lang('Pager.last') ?>" class="page-link">
                <span aria-hidden="true"><?php echo lang('Pager.last') ?></span>
            </a>
        </li>
        <?php endif ?>
    </ul>
</nav>
<?php } ?>