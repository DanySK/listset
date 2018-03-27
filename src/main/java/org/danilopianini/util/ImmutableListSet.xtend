package org.danilopianini.util

import com.google.common.collect.ImmutableList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Delegate

class ImmutableListSet<E> implements ListSet<E> {
    
    @Delegate val ImmutableList<E> base;

    private new(ImmutableList<E> base) { this.base = base }

    def public static <E> ListSet<E> of(E... elements) {
        new ImmutableListSet(ImmutableList.copyOf(elements))
    }

    def public static <E> ListSet<E> copyOf(Collection<E> elements) {
        new ImmutableListSet(ImmutableList.copyOf(elements))
    }

    def public static <E> ListSet<E> copyOf(Iterable<E> elements) {
        new ImmutableListSet(ImmutableList.copyOf(elements))
    }
    
    def public static <E> Builder<E> newBuilder() {
        new Builder()
    }

    override def toString() {
        base.toString
    }
    
    override def hashCode() {
        base.hashCode
    }
    
    override def equals(Object o) {
        base.equals(o)
    }
    
    public static class Builder<E> {
        val ListSet<E> contents = new LinkedListSet
        public new() {}
        def Builder<E> add(E... elements) {
            contents.addAll(elements)
            this
        }
        def Builder<E> add(E element) {
            contents.add(element)
            this
        }
        def Builder<E> addAll(Iterable<? extends E> elements) {
            contents.addAll(elements)
            this
        }
        def ImmutableListSet<E> build() {
            return new ImmutableListSet(ImmutableList.copyOf(contents))
        }
    }
    
}